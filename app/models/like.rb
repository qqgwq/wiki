class Like < ApplicationRecord
  belongs_to :user 
  belongs_to :likeable, polymorphic: true #counter_cache: true
  has_many :notifications, as: 'subject', dependent: :delete_all
  validates :user, :likeable, presence: true
end
