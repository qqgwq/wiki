FactoryGirl.define do
  factory :notification do
    user
    trait :for_comment do
      association(:subject, factory: 'comment')
    end
    trait :for_like do
      association(:subject, factory: 'like')
    end
  end
end