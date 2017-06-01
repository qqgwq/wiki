class Admin::SessionsController < Admin::BaseController
  def new
  end

  def create
    #binding.pry
    @user = User.find_by(phone: login_params[:phone])
    if @user && @user.authenticate(login_params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      login_as @user
      redirect_to admin_users_path
      flash[:success] = "欢迎您! #{@user.name}!"
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