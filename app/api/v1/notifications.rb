module V1
  class Notifications < Grape::API
    format :json
    namespace :notifications do
      get 'notification', serializer: V1::NotificationSerializer, root: 'notification' do
        Notification.all
      end
    end
  end
end