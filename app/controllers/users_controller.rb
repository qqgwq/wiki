class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy, :person]
  before_action :right_user, only: [:edit, :destroy]
  #before_action :require_is_admin, only: [:index, :show]
  #before_action :authenticate!, except: [:index, :show]

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
    @user = User.new(user_params)
    if verify_rucaptcha?(@user) && @user.save
      SmsJob.set(wait: 1.minute).perform_later(@user.phone, @user.name)
      login_as @user
      redirect_to @user
    else
      flash.now[:danger] = "验证码错误"
      render :new
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
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
     @user.destroy 
     redirect_to root_path
  end

  

  private

  def find_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:phone, :name, :password, :password_confirmation, :image, :email)
  end
end
