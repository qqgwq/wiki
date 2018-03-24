FactoryGirl.define do
  factory :notification do
    user
    association :subject, factory: 'comment'
    association :subject, factory: 'like'
  end
end