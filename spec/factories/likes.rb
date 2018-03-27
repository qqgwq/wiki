FactoryGirl.define do
  factory :like do
    user
    association :likeable, factory: 'article'
    association :likeable, factory: 'comment'
  end
end