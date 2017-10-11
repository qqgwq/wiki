module V1
  class Comments < Grape::API
    format :json
    namespace :comments do
      desc "所有评论"
      get "all_comments", each_serializer: V1::CommentSerializer, root: 'comment' do
        Comment.all
      end

      desc "创建评论, 需要认证"
      params do
        requires :user_id, type: Integer, desc: "用户ID"
        requires :article_id, type: Integer, desc: "文章ID"
        requires :content, type: String, desc: "文章内容"
      end
      post "create_comment", each_serializer: V1::CommentSerializer, root: 'comment' do
        authenticate!
        #binding.pry
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(params)
        if @comment.save
          if current_user != @article.user
            Notification.create!(
                  user: @article.user,
                  subject_id: @comment.id,
                  subject_type: "Comment",
                  read: false
            )
          else
            return
          end
          render current_user
        else
          error!({"error" => current_user.errors.full_messages.first}, 400)
        end
      end

      desc '删除评论, 需要认证'
      params do
        requires :article_id, type: Integer, desc: "文章ID"
        requires :comment_id, type: Integer, desc: "评论ID"
      end
      delete "delete_comment", each_serializer: V1::CommentSerializer, root: 'comment' do
        authenticate!
        @article = current_user.articles.find(params[:article_id])
        @comment = @article.comments.find(params[:comment_id]).destroy
        render current_user
      end
    end
  end
end