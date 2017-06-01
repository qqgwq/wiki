class Admin::BaseController < ActionController::Base
  layout 'admin'
  helper_method :login?
  private

  def current_admin_user
    @current_admin_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login?
    !!current_admin_user
  end
end