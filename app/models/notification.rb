class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :subject, polymorphic: true
  validates :user, presence: true
  ALLOWED_TYPES = %w(Comment, Like, Comment).freeze
  validates :subject_type, inclusion: { in: ALLOWED_TYPES}
  scope :unread, -> { where(read: false) }
end
