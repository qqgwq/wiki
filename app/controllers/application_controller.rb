class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_raven_context
  helper_method :login?, :current_user, :right_user, :correct_user, :require_is_admin
  include ExceptionHandler
  
  private
   class AccessDenied < Exception; end

    def current_user
      @current_user ||= login_from_session || login_from_cookies
    end

    def require_login
     unless login?
       store_location
       redirect_to login_path
    end
   end
  
  def login_as(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logout
    cookies.delete(:auth_token)
    session[:user_id] = nil
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
    if cookies[:auth_token]
      User.find_by_auth_token(cookies[:auth_token])
    else
      nil
    end
  end

  def store_location
    session[:return_to] = request.fullpath if request.get?
  end

  def redirect_back_or_default(default)
    session.delete(:return_to)
    redirect_to(session[:return_to] || default) and return
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
      flash[:error] = "你不是管理员"
      redirect_to root_path
      false
    end
  end

  # def remember_me
  #   cookies[:auth_token] = {
  #     value: current_user.auth_token,
  #     expires_after: 60.minutes,
  #     httponly: true
  #   }
  # end

  def forget_me
    cookies.delete(:auth_token)
  end

  def set_raven_context
    Raven.user_context(id: session[:current_user_id])
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
