require "rails_helper"

RSpec.describe ArticlesController, type: :controller do
  include TestHelper
  describe "#New" do
    subject(:article) { Article.new }
    it "test new action" do
      get :new
      expect(article).to be_a_new(Article)
    end
  end

  describe "#Index" do
    it "test index action" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#Show" do
    it "should show article" do
      article = create(:article)
      get :show, params: { id: article }
      expect(response.status).to eq(200)
    end
  end

  describe "#Create" do
    it "should create article" do
      user = create(:user)
      post :create, params: { article: attributes_for(:article), user: user.id }
      expect(response.content_type).to eq("text/html")
    end
  end

  describe "should create failure" do
    it "test failure" do
      post :create, params: { aritcle: {} }
      expect(Article.count).to eq(0)
    end
  end

  describe "should edit article" do
    it "test edit" do
      article = create(:article)
      login_as article.user
      get :edit, params: { id: article }
      expect(response.status).to eq(200)
    end
  end

  describe "should update article" do
    it "test update" do
      article = create(:article)
      login_as article.user
      put :update, params: { id: article.id, article: article.attributes } 
      article.reload
      expect(response).to redirect_to root_url
    end
  end

  describe "should delete article" do
    it "test delete" do
      article = create(:article)
      login_as article.user
      delete :destroy, params: { id: article.id }
      expect(response).to redirect_to articles_path
    end
  end

  describe "should release" do
    it "test release" do
      article = create(:article)
      get :release, params: { user_id: article.user, id: article }
      expect(Article.count).to eq(1)
    end
  end
end