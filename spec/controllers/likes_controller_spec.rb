require "rails_helper"

RSpec.describe LikesController, type: :controller do
  include TestHelper
  describe "#Create" do
    it "test like" do
      # binding.pry
      article = create(:article)
      login_as article.user
      post :create, params: { article_id: article.id }, xhr: true
      expect(Like.count).to eq(1)
    end
  end

  describe "#create Notification" do
    it "should create like after create notificaiton" do
      article = create(:article)
      login_as article.user
      #binding.pry
      like = article.likes.find_or_create_by(user: article.user)
      Notification.create(user: article.user, subject_id: like.id)
      expect(Notification.count).to eq(1)
    end
  end

  describe "#Destroy" do
    it "test dislike" do
      article = create(:article)
      login_as article.user
      delete :destroy, params: { article_id: article.id }, xhr: true
      expect(Like.count).to eq(0)
    end
  end
end