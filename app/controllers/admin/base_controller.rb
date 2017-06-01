class Admin::BaseController < ActionController::Base
  layout 'admin'
  helper_method :login?
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login?
    !!current_user
  end

  def login_as(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logout
    session[:user_id] = nil
  end
end