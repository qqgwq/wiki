module V1
  class CategorySerializer < ActiveModel::Serializer
    attributes :id, :name
    has_many :articles
  end
end
