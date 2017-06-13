module V1
  class Articles < Grape::API
    format :json
    namespace :articles do
      get "article", serializer: V1::ArticleSerializer, root: 'article' do
        Article.all
      end
    end
  end
end