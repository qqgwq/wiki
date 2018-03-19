FactoryGirl.define do
  factory :like do
    user
    association :likeable, factory: 'article'
  end
end