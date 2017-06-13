module V1
  class ArticleSerializer < ActiveModel::Serializer
    attributes :title, :id, :content
  end
end