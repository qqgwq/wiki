class Admin::ApplicationController < ApplicationController
  layout 'admin'
  before_action :require_login, :admin_required
  private

  def admin_required
    raise AccessDenied unless current_user.admin?
  end
end