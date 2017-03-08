class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :login?, :current_user, :right_user, :correct_user

  private
   class AccessDenied < Exception; end

    def current_user
      @current_user || login_from_session unless defined?(@current_user)
    end

    def require_login
     unless login?
       flash[:danger] = "请登录"
       redirect_to login_path
    end
   end
  
  def login_as(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def login?
    !current_user.nil?
  end

  def login_from_session
    if session[:user_id].present?
      begin
        User.find session[:user_id]
      rescue
        session[:user_id] = nil
      end
    end
  end

  def correct_user
    current_user?(@article.user)
  end

  def right_user
    @user == current_user
  end

  def current_user?(user)
    user == current_user
  end

  def set_search
    @q = Article.search(params[:q])
  end
  
  def require_is_admin
    if !current_user.admin?
      flash[:danger] = "你不是管理员"
      redirect_to root_path
    end
  end
end
