class PasswordResetsController < ApplicationController
  def new
  end

  def create
    phone, verification_code = user_params.dig("phone"), user_params.dig("verification_code")
    reset_value = Redis::Value.new("#{params[:phone]}_code", expiration: 2.minutes)
    if reset_value.value.to_s == verification_code.to_s
    @user = User.find_by(phone: params[:phone])
    if @user
      flash[:success] = "重置成功"
      redirect_to edit_password_resets_path
    else
      flash[:danger] = "你还没注册"
      render :new
      end
    end
  end

  def password_resets_code
    @user = User.find_by(phone: params[:phone])
    if @user
      @password_reset = Redis::Value.new("#{params[:phone]}_code", expiration: 2.minutes)
      @password_reset.value = sms_code
      PasswordResetJob.perform_later(params[:phone], @password_reset.value)
    end
  end

  def sms_code
    rand(000000..999999)
  end

  def edit
  end

  def update
    if @user = User.find_by(phone: params[:phone])
      @user.update_attributes!(:password => params[:password])
      flash[:success] = "重置密码成功"
      redirect_to root_url
    else
      render 'edit'
    end
  end



  private
  def user_params
    params.permit(:password, :phone, :verification_code)
  end
end
