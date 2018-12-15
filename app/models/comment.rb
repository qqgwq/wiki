class Comment < ApplicationRecord
  attr_accessor :comment_id
  belongs_to :article, counter_cache: true
  belongs_to :user
  has_many :notifications, as: 'subject', dependent: :delete_all
  has_many :likes, as: "likeable", dependent: :destroy
  validates :content, presence: true

  def is_like_comment?(user)
    likes.where(user: user_id).first
  end

  def comment_deleted?
    is_deleted
  end
end
