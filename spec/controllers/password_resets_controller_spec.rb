require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do
  describe "reset password" do
    it "test reset password" do
      post :create
      expect(response.status).to eq(200)
    end
  end


  describe "Random 6" do
    it "test sms_code" do
      expect(controller.sms_code.to_s).to match(/^\d{6}$/)
    end
  end

  describe "#Update" do
    it "test update action" do
      user = create(:user)
      put :update, params: { id: user, user: user.password }
      user.reload
      expect(response.status).to eq(200)
    end
  end
end
