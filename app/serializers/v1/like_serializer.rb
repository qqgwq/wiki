module V1
  class LikeSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :likeable
    belongs_to :user
    has_many :likeable, polymorphic: true
  end
end
