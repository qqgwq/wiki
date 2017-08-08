class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :user, :article, presence: true

  scope :unread, -> { where(read: false) }
end
