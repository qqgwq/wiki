module V1
  class Likes < Grape::API
    format :json
    namespace :likes do
      desc "用户对文章的点赞, 需要验证"
      params do
        requires :article_id, type: Integer, desc: "文章ID"
        requires :user_id, type: Integer, allow_blank: false, desc: "用户id"
      end

      post "like" do
        authenticate!
        @likeable = Article.find(params[:article_id])
        @likeable.likes.where(user_id: current_user).first_or_create
      end

      desc "用户取消文章点赞, 需要验证"
      params do
        requires :article_id, type: Integer, desc: "文章ID"
        requires :user_id, allow_blank: false, type: Integer
      end

      delete "unlike" do
        authenticate!
        @likeable = Article.find(params[:article_id])
        @likeable.likes.where(user_id: current_user).delete_all
      end
    end
  end
end