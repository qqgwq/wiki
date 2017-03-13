class Article < ApplicationRecord
  include Likeable
  belongs_to :user
  belongs_to :category
  has_many :comments



  def is_user_like?(user)
    likes.map(&:user_id).include? user.id
  end
end


