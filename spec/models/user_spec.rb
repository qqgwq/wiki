require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: "gwq", is_admin: true, email: "gwq@qq.com")
  context "validation" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:verification_code) }
  end

  describe User do
    it { should have_many(:articles).dependent(:delete_all) }
    it { should have_many(:comments).dependent(:delete_all) }
    it { should have_many(:notifications) }
    it { should have_many(:likes) }
  end

  it "if user is admin return ture" do
    expect(user.admin?).to eq(true)
  end

  it "if user isn't admin return false" do
    user1 = User.create(name: "gby", is_admin: false)
    expect(user1.admin?).to eq(false)
  end

  it "Determine if auth_token not nil" do
    auth_token = SecureRandom.urlsafe_base64
    user.generate_token(:auth_token)
    expect(user.auth_token).not_to be_nil
  end

  it "generate User csv file" do
    expect(User.to_csv).not_to be_nil
  end
end
