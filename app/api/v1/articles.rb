module V1
  class Articles < Grape::API
    format :json
    namespace :articles do
      get "article", serializer: V1::ArticleSerializer, root: 'article' do
        Article.all
      end
    
      desc "分页"
      params do
        optional :offset, type: Integer, default: 0, desc: "页数"
        optional :limit, type: Integer, default: 4, desc: "每页显示条数"
      end
      get "paginate", each_serializer: V1::ArticleSerializer, root: 'article' do
        @article = Article.order(created_at: :desc).offset(params[:offset].to_i * 4).limit(params[:limit])
      end

      desc "创建文章, 需要验证"
      params do
        requires :title, type: String, allow_blank: false, desc: "标题"
        requires :content, type: String, allow_blank: false, desc: "内容"
        requires :category_id, type: Integer, allow_blank: false, desc: "类别"
        requires :avatar, type: Rack::Multipart::UploadedFile, allow_blank: false, desc: "图片"
        requires :user_id, type: Integer, allow_blank: false, desc: "用户id"
      end
      post "create_article", serializer: V1::ArticleSerializer, root: 'user' do
        authenticate!
        @article = Article.new(params)
          if @article.save
            render @article
          else
            error!({error: @article.errors.full_messages.first}, 400)
        end
      end

      desc "编辑文章, 需要验证"
      params do
        optional :title, type: String, desc: "文章标题"
        optional :content, type: String, desc: "文章内容"
        optional :category_id, type: Integer, desc: "文章分类"
        optional :image, type: Rack::Multipart::UploadedFile, desc: "图片"
        optional :article_id, type: Integer, desc: "文章ID"
      end
      patch "", each_serializer: V1::ArticleSerializer, root: 'article' do
        authenticate!
        @article = current_user.articles.find(params[:article_id])
        if @article.update(params)
          render current_user
        else
          error!({"error" => current_user.errors.full_messages.first}, 401)
        end
      end

      desc "删除文章, 需要验证"
      params do
        requires :id, type: Integer
        requires :user_id, type: Integer
      end
      delete "", each_serializer: V1::ArticleSerializer, root: 'article' do
        #binding.pry
        authenticate!
        @article = current_user.articles.find(params[:id]).destroy
        render current_user 
      end
    end
  end
end