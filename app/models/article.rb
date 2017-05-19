class Article < ApplicationRecord
  include Likeable
  # extend FriendlyId
  # friendly_id :title
  belongs_to :user
  belongs_to :category
  has_many :comments
  validates :title, presence: true, length: { in: 3..11 }
  validates :content, presence: true


  def is_user_like?(user)
    likes.map(&:user_id).include? user&.id
  end

  def view!
    self.increment!(:views_count)
  end
end

