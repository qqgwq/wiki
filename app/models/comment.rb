class Comment < ApplicationRecord
  belongs_to :article, counter_cache: true
  belongs_to :user
  validates :content, presence: true

  def create_article_notification
    if user != article.user
      Notification.create!(user: article.user,
                          article_id: article.id)
    end
  end
end
