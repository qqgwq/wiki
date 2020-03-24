require 'rails_helper'

RSpec.describe HomesHelper, type: :helper do
  describe '#return user current age' do
    it "return current age" do
      expect(helper.current_age).to eq(Date.today.year - 1995)
    end
  end 
end