class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def new
    @user = User.new
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

  def show
    @user = User.find(params[:id])
  end
end
