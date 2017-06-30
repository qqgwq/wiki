require 'rails_helper'

RSpec.describe Article, type: :model do
  context "validation" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:avatar) }
  end
end
