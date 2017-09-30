class Comment < ApplicationRecord
  attr_accessor :comment_user_id
  belongs_to :article, counter_cache: true
  belongs_to :user
  has_many :notifications, as: 'subject'
  validates :content, presence: true
end
