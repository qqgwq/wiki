class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :comment
  validates :user, :article, presence: true

  scope :unread, -> { where(read: false) }
end
