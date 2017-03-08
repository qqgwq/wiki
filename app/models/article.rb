class Article < ApplicationRecord
  include Likeable
  belongs_to :user
  belongs_to :category
  has_many :comments
end


