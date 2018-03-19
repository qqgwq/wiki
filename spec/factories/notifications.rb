FactoryGirl.define do
  factory :notification do
    user
    association :subject, factory: 'comment'
  end
end