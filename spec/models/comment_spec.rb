require 'rails_helper'

RSpec.describe Comment, type: :model do
  include TestHelper
  context "validation" do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe Comment do
    it { should belong_to(:article).counter_cache(true) }
    it { should belong_to(:user) }
    it { should have_many(:notifications).dependent(:delete_all) }
  end

  it "should comment like" do
    comment = create(:comment)
    expect(comment.likes.count).to eq(0)
  end
end