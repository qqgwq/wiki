module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :phone
    has_many :likes
    has_many :articles
    has_many :comments
  end
end
