require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  include TestHelper
  describe "should all notiflcation" do
    it "test all notification" do
      comment = create(:comment)
      notification = create(:notification, subject: comment)
      login_as notification.user
      get :index
      expect(Notification.count).to eq(1)
    end
  end

  describe "should delete notification" do
    it "test delete notification" do
      user = create(:user)
      notification = create(:notification, user: user)
      login_as user
      delete :destroy, params: {user_id: user, id: notification }
      expect(Notification.count).to eq(0)
    end
  end

  describe "should mark all as read" do
    it "test mark" do
      user = create(:user)
      login_as user
      notification = create(:notification, user: user)
      expect(notification.read).to eq(false)
    end
  end

  describe "should clear all read notification" do
    it "test clear" do
      user = create(:user)
      login_as user
      notifications = create(:notification, user: user)
      expect(response.status).to eq(200s)
    end
  end
end
