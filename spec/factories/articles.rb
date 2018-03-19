FactoryGirl.define do
  factory :article do |f|
    user
    f.title "哈哈哈"
    f.content "哈哈哈哈"
    f.avatar Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'jp.jpeg'), 'image/png')
  end
end