FactoryGirl.define do
  factory :user do |f|
    f.name "gwq"
    f.email "gwq@qq.com"
    f.phone "18382012700"
    f.password "gwq1995"
    f.verification_code "23456"
    f.image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'jp.jpeg'), 'image/png')
  end
end