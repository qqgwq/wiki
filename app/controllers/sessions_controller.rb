class SessionsController < ApplicationController

  def new
  end

  def create
    login = login_params[:login]
    @user = if login.include?('@')
              User.find_by(email: params[:login])
            else
              User.find_by(phone: params[:login])
            end
    if @user && @user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      redirect_back_or_default @user
      flash[:success] = "欢迎您! #{@user.name}!"
    else
      flash.now[:warning] = "账号或密码错误"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url
    flash[:success] = "退出成功"
  end


  private

  def login_params
    params.permit(:login, :password)
  end
end
