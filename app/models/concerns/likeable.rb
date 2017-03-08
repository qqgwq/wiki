module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: 'Likeable', dependent: :delete_all
  end

  def like_by?(user)
    likes.where(user: user).exists?
  end
end