class Article < ApplicationRecord
  include Likeable
  # extend FriendlyId
  # friendly_id :title
  belongs_to :user
  belongs_to :category
  has_many :comments
  validates :title, presence: true, length: { in: 3..11 }
  validates :content, presence: true
  validates :avatar, attachment_presence: true
  has_attached_file :avatar, styles: { :original => '300x300>', :small => "200x200#" }
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/png", "image/jpeg"]
  validates_attachment_size :avatar, less_than: 5.megabytes

  def is_user_like?(user)
    likes.map(&:user_id).include? user&.id
  end

  def view!
    self.increment!(:views_count)
  end
end

