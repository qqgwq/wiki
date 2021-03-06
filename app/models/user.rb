class User < ApplicationRecord 
  #before_destroy :no_referenced_comments
  include Redis::Objects
  sorted_set :ranks, :global => true
  sorted_set :checkin_score, :global => true
  attr_accessor :verification_code
  include Concerns::AuthToken
  extend FriendlyId
  friendly_id :name
  has_secure_password
  has_many :articles, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :notifications
  has_many :likes
  has_many :like_articles, through: :likes, source: :likeable, source_type: "Article"
  validates :name, :phone, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 1..11 }, on: :create
  validates :verification_code, presence: true, on: :create
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  #validates :image, attachment_presence: true
  has_attached_file :image, styles: { :original => '250x250>', :small => "200x200#" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/png", "image/jpeg"]
  validates_attachment_size :image, less_than: 5.megabytes
  before_create { generate_token(:auth_token) }
  after_create :init_score

  enum gender: ["male", "female"]


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

  def name=(value)
    write_attribute :name, value
    write_attribute :name_lower, value.downcase
  end

  def email=(value)
    write_attribute :email, value
    write_attribute :email_lower, value.downcase
  end

  #postgres 排序
  def self.order_by_ids(ids)
    order_by = ["case"]
    ids.each_with_index.map do |id, index|
      order_by << "WHEN id='#{id}' THEN #{index}"
    end
    order_by << "end"
    order(order_by.join(" "))
  end

  #用户排名
  def rank
    ranks.revrank(self.id)&.next
  end

  #用户积分
  def score
    ranks.score(self.id).to_i
  end

  #用户签到
  def self.daily_score
    sign_key = "daily_#{Date.today.to_s}"
    Redis::Set.new(sign_key)
  end

  def is_sign?
    self.class.daily_score.member?(id)
  end

  def sign!
    self.class.daily_score << id
    self.checkin_score.incr(id)
  end

  #创建一个用户初始redis值为0
  private
  def init_score
    ranks.incr(self.id, 0)
  end
end