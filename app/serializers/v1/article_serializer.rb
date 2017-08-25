module V1
  class ArticleSerializer < ActiveModel::Serializer
    attributes :title, :id, :content, :user_id, :category_id
    has_many :likes, as: 'likeable'
    belongs_to :user
    belongs_to :category
  end
end