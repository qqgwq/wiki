class Comment < ApplicationRecord
  attr_accessor :comment_id
  belongs_to :article, counter_cache: true
  belongs_to :user
  has_many :notifications, as: 'subject', dependent: :delete_all
  validates :content, presence: true
end
