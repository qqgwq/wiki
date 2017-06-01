class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: [:show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if verify_rucaptcha?(@user) && @user.save
      login_as @user
      redirect_to admin_users_path
    else
      flash.now[:danger] = "验证码错误"
      render :new
    end
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

   def user_params
    params.require(:user).permit(:phone, :name, :password, :password_confirmation, :image)
  end

  def find_user
    @user = User.friendly.find(params[:id])
  end
end
