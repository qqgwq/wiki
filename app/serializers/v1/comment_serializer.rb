module V1
  class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :article
  belongs_to :user
  end
end

