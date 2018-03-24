FactoryGirl.define do
  factory :article do |f|
    user
    category
    f.title "哈哈哈"
    f.sequence(:content) { |n| "哈哈哈哈#{n}" }
    f.avatar Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'jp.jpeg'), 'image/png')
  end
end