require 'rails_helper'
RSpec.describe Like, type: :model do
  context "validation" do
    [:user, :likeable].each do |field|
      it { should validate_presence_of(field) }
    end
  end

  describe Like do
    it { should belong_to(:user) }
    it { should belong_to(:likeable) }
    it { should have_many(:notifications).dependent(:delete_all) }
  end
end