require "rails_helper"
RSpec.describe "API V1", 'articles', type: :request do
  describe "GET ALL Articles" do
    it "should return all articles" do
      get "/api/articles/article.json"
      article = Article.all
      expect(article).to eq(Article.all)
    end
  end

    it "should article desc" do
      article = create_list(:article, 4)
      get "/api/articles/paginate.json", params: { offset: 0, limit: 4 }
      expect(response.status).to eq(200)
      #binding.pry
      json = JSON.parse(response.body)
      expect(json['article'].size).to eq(4)
      expect(json['article'][0]['title']).to eq('哈哈哈')
      expect(json['article'][1]['title']).to eq('哈哈哈')
      expect(json['article'][2]['title']).to eq('哈哈哈')
      expect(json['article'][3]['title']).to eq('哈哈哈')
    end

    # it "create an article requires login" do
    #   category_id = create(:category).id
    #   user_id = create(:user).id
    #   avatar = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'jp.jpeg'), 'image/png', true)
    #   params = { title: "哈哈哈", content: "黄帝内经", category_id: category_id,
    #     avatar: avatar, user_id: user_id }
    #   post "/api/articles/create_article", params: params, headers: headers.merge(authenticate_token)
    #   #binding.pry
    #   expect(response.status).to eq(200)
    # end
end