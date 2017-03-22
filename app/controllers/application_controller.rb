class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :login?, :current_user, :right_user, :correct_user

  private
   class AccessDenied < Exception; end

    def current_user
      @current_user ||= login_from_session || login_from_cookies
    end

    def require_login
     unless login?
       store_location
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
    forget_me
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

  def login_from_cookies
    if cookies[:remember_token].present?
      if user = User.find_by_remember_token(cookies[:remember_token])
        session[:user_id] = user.id
        user
      else
        forget_me
        nil
      end
    end
  end

  def store_location
    session[:forwarding_url] = request.original_fullpath if request.get?
  end

  def redirect_back_to(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
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

  def remember_me
    cookies[:remember_token] = {
      value: current_user.remember_token,
      expires_after: 60.minutes,
      httponly: true
    }
  end

  def forget_me
    cookies.delete(:remember_token)
  end
end
