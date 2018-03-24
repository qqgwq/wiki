require "rails_helper"
RSpec.describe SessionsController, type: :controller do
  include TestHelper
  def setup
    #reset access limit
    $redis.flushdb
  end

  describe "#New" do
    it "test new" do
      get :new
      expect(response).to be_success
    end
  end

  describe "#Destroy" do
    it "should destroy session" do
      login_as create(:user)
      delete :destroy
      expect(request.session[:user_id]).to be_nil
    end
  end
end