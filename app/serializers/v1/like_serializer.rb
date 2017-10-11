module V1
  class LikeSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :likeable
    belongs_to :user
    has_many :likeable, polymorphic: true
    has_many :notifications, as: 'subject', dependent: :delete_all
  end
end
