module V1
  class NotificationSerializer < ActiveModel::Serializer
    attributes :id, :user_id
    belongs_to :user
    has_many :subject, polymorphic: true
  end
end