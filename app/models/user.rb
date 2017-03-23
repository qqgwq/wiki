class User < ApplicationRecord 
  before_destroy :no_referenced_comments
  extend FriendlyId
  friendly_id :name
  has_secure_password
  has_many :articles
  has_many :comments
  has_many :likes
  has_many :like_articles, through: :likes, source: :likeable, source_type: "Article"
  validates :name, :phone, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 1..11 }
  has_attached_file :image, styles: { :medium => "300x300#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  def admin?
    is_admin
  end

   def remember_token
    [id, Digest::SHA512.hexdigest(password_digest)].join('$')
  end

  def self.find_by_remember_token(token)
    user = find_by_id(token.split('$').first)
    (user && Rack::Utils.secure_compare(user.remember_token, token)) ? user : nil
  end

  private
   def no_referenced_comments
     return if comments.empty?
    #errors.add_to_base("This user is referenced by comment(s): #{comments.map(&:id).to_sentence}")
    false 
   end
end