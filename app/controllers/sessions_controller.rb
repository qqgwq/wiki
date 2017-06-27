class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(phone: params[:phone])
    if @user && @user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      #login_as @user
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


  # private

  # def login_params
  #   params.require(:session).permit(:phone, :password)
  # end
end
