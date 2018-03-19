require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do
  describe "Random 6" do
    it "test sms_code" do
      expect(controller.sms_code.to_s).to match(/^\d{6}$/)
    end
  end
end
