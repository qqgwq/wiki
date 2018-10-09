module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :phone, :gender
    has_many :likes
    has_many :articles
    has_many :comments
    has_many :notifications
  end
end
