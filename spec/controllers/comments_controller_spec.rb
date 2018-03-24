require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  include TestHelper
  describe "#Create" do
    it "should create comment" do
      article = create(:article)
      login_as article.user
      post :create, params: { article_id: article.id, comment: { content: "content" } }, xhr: true
      expect(Comment.count).to eq(1)
    end
  end

  describe "create notification" do
    it "should create notification after create comment" do
      article = create(:article)
      login_as article.user
      post :create, params: { article_id: article.id, comment: { content: "content" } }, xhr: true
      expect(Notification.count).to eq(1)
    end
  end

  describe "#Edit" do
    it "should edit comment" do
      article = create(:article)
      login_as article.user
      comment = article.comments.create(content: "content")     
      get :edit, params: { article_id: article.id, id: comment.id }
      expect(response.status).to eq(200)
    end
  end

  describe "#Update" do
    it "should update comment" do
      article = create(:article)
      login_as article.user
      comment = article.comments.create(content: "content")  
      put :update, params: { article_id: article.id, id: comment.id, comment: { content: "哈哈" } }
      expect(response).to redirect_to article_path
    end
  end

  describe "#Destroy" do
    it "should delete comment" do
      article = create(:article)
      login_as article.user
      comment = article.comments.create(content: "content")
      delete :destroy, params: { article_id: article.id, id: comment.id }
      expect(Comment.count).to eq(0)
    end
  end
end