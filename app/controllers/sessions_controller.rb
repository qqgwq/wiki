class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(phone: login_params[:phone])
    if @user && @user.authenticate(login_params[:password])
      login_as @user
      remember_me
      redirect_back_to @user
      flash.now[:danger] = "请登录"
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url
  end


  private

  def login_params
    params.require(:session).permit(:phone, :password)
  end
end
