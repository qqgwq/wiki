FactoryGirl.define do
  factory :user do |f|
    f.sequence(:name)  { |n| "gwq_#{n}" } 
    f.sequence(:email) { |n| "gwq@qq.com_#{n}" }
    f.sequence(:phone) { |n| "18382012700_#{n}" }
    f.password "gwq1995"
    f.verification_code "23456"
    f.image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'jp.jpeg'), 'image/png')
  end
end