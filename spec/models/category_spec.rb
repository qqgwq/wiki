require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validation" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe Category do
    it { should have_many(:articles) }
  end
end