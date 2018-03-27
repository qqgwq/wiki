class Article < ApplicationRecord
  include Likeable
  include Redis::Objects
  set :limit_read
  # extend FriendlyId
  # friendly_id :title
  counter :click_count
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, as: 'likeable', dependent: :destroy
  validates :title, presence: true, length: { in: 3..11 }
  validates :content, presence: true
  validates :avatar, attachment_presence: true
  has_attached_file :avatar, styles: { :original => '300x300>', :small => "200x200#" }
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/png", "image/jpeg"]
  validates_attachment_size :avatar, less_than: 5.megabytes
  enum status:[:audit, :complete, :deny]

  def is_user_like?(user)
    likes.map(&:user_id).include? user&.id
  end

  def view!
    self.increment!(:views_count)
  end

  def self.random_saying
    %w(知之者不如好之者，好之者不如乐之者。——孔子 一次失败，只是证明我们成功的决心还够坚强。——博维 
        成功的唯一秘诀——坚持最后一分钟。——柏拉图).sample
  end
end

