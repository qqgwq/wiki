class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy, :person]
  before_action :right_user, only: [:edit, :destroy]
  #before_action :require_is_admin, only: [:index, :show]
  #before_action :authenticate!, except: [:index, :show]
  include CheckController

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  def show
  end

  def create
    phone, verification_code = user_params.dig("phone"), user_params.dig("verification_code")
    phone_value = Redis::Value.new("#{params[:phone]}", expiration: 2.minutes) #初始化Redis::Value实例且value不为nil, 获取的手机验证码
    if User.exists?(phone: phone)
      flash[:danger] = "用户已注册"
      redirect_to new_user_path
    else
      if phone_value.value.to_s == verification_code.to_s
        @user = User.new(user_params)
        if @user.save
          SmsJob.set(wait: 1.minute).perform_later(@user.phone, @user.name)
          login_as @user
          redirect_to @user
        else
          redirect_to new_user_path
        end
      else
        flash.now[:danger] = "验证码错误"
        render :new       
      end              
    end
  end

  def edit
  end

  def person
  end

  def profile
    @profile = User.friendly.find(params[:id])
  end


  def update
    if @user.update_attributes params.require(:user).permit(:name, :phone, :email, :password, :image, :gender)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
     @user.destroy 
     redirect_to root_path
  end

  #短信验证码
  def get_sms_code
    if User.exists?(phone: params[:phone])
      flash[:danger] = "用户已注册" 
      redirect_to new_user_path
    end
    @phone = Redis::Value.new("#{params[:phone]}", expiration: 2.minutes)
    if @phone.value.present? #验证短信是否已发送
      flash[:danger] = "短信发送中, 请稍等"
      redirect_to new_user_path
    else
      @result = { sms_code: @phone.value }
      @phone.value = sms_code
      SmsCodeJob.perform_later(params[:phone], @phone.value)
    end
  end

  def sms_code
    rand(000000..999999)
  end

  private

  def find_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.permit(:phone, :name, :password, :verification_code, :email, :gender)
  end
end
