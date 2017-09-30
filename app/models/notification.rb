class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :subject, polymorphic: true
  validates :user, presence: true
  scope :unread, -> { where(read: false) }
end
