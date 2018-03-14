require 'rails_helper'

RSpec.describe Notification, type: :model do
  context "validation"
  it { is_expected.to validate_presence_of(:user)}

  describe Notification do
    it { should belong_to(:user) }
    it { should belong_to(:subject) }
  end

  it "define notification unread default false" do
    expect(Notification.unread).to eq([])
  end

end
