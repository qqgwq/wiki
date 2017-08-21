class Comment < ApplicationRecord
  belongs_to :article, counter_cache: true
  belongs_to :user
  has_many :notifications
  validates :content, presence: true

  # def create_notification
  #   create_article_notification
  #   create_comment_notification
  # end

  # #回复评论
  # def create_comment_notification
  #   if user != self.user
  #     Notification.create!(article_id: self.article.id,
  #                         user: self.user,
  #                         comment_id: self.id)
  #   end
  # end

  #创建文章评论通知
  def create_article_notification
    if user != article.user
      Notification.create!(user: article.user,
                          article_id: article.id)
    end
  end
end
