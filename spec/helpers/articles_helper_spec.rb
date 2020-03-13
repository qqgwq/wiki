require 'rails_helper'


RSpec.describe ArticlesHelper, type: :helper do
  describe 'CopyRight current year' do
    it "return current year" do
      expect(helper.current_copyright_year).to eq(Date.today.year)
    end
  end
end
