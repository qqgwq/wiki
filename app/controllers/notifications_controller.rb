class NotificationsController < ApplicationController
  before_action :require_login

  def index
    @notifications = current_user.notifications.order(id: :desc).page(params[:page]).per(3)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @notification = current_user.notifications.find(params[:id])
    @notification.destroy
  end

  def mark
    current_user.notifications.unread.update_all(read: true)
  end

  def clear
    current_user.notifications.delete_all
    respond_to do |format|
    format.js { redirect_to notifications_path }
    end
  end
end
