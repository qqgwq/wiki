require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:image) }
  end
end
