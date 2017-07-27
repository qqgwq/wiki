class User < ApplicationRecord 
  #before_destroy :no_referenced_comments
  extend FriendlyId
  friendly_id :name
  has_secure_password
  has_many :articles, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes
  has_many :like_articles, through: :likes, source: :likeable, source_type: "Article"
  validates :name, :phone, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 1..11 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :image, attachment_presence: true
  has_attached_file :image, styles: { :original => '250x250>', :small => "200x200#" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/png", "image/jpeg"]
  validates_attachment_size :image, less_than: 5.megabytes
  before_create { generate_token(:auth_token) } 

  def admin?
    is_admin
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def self.rencent_user
    User.where("created_at > ?", Time.current.ago(1.day))
  end

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << column_names
    all.each do |user|
      csv << user.attributes.values_at(*column_names)
      end
    end
  end
  


  # private
  #  def no_referenced_comments
  #    return if comments.empty?
  #   #errors.add_to_base("This user is referenced by comment(s): #{comments.map(&:id).to_sentence}")
  #   false 
  #  end
end