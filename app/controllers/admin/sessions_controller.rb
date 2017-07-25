class Admin::SessionsController < Admin::ApplicationController
  def new
  end

  def create
    #binding.pry
    @user = User.find_by(phone: login_params[:phone])
    if @user && @user.authenticate(login_params[:password])
      login_as @user
      redirect_to admin_users_path
    else
      flash.now[:warning] = "账号或密码错误"
      render :new
    end
  end

  def destroy
    logout
    redirect_to admin_users_path
  end


  private

  def login_params
    params.require(:session).permit(:phone, :password)
  end
end