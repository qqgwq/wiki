require 'rails_helper'

RSpec.describe Article, type: :model do
  article = Article.new
  user = User.create(name: "gwq")
  context "validation" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:avatar) }
  end

  describe Article do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  it "Determine if the user has liked it" do
    expect(article.is_user_like?(user)).to eq(false)
  end

  it "check user views" do
    expect{article.view!}.to change{article.views_count}.by(1)
  end

  it "Random Saying" do
    expect(Article.random_saying).to eq("知之者不如好之者，好之者不如乐之者。——孔子")
    #expect(["xxx", "xxxx"]).to include(self.instance_method)
  end
end
