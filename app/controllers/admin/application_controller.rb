class Admin::ApplicationController < ApplicationController
  layout 'admin'
  before_action :admin_required, :require_login
  private

  def admin_required
    raise AccessDenied unless current_user.admin?
  end
end