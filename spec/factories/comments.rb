FactoryGirl.define do
  factory :comment do
    user
    article
    content "哈哈哈哈"
  end
end