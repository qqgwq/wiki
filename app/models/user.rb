class User < ApplicationRecord
  has_secure_password
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 1..11 }
  has_attached_file :image, styles: { :medium => "300x300#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def admin?
    is_admin
  end
end
