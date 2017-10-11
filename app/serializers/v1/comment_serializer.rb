module V1
  class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :article
  belongs_to :user
  has_many :notifications, as: "subject", dependent: :delete_all
  end
end

