FactoryGirl.define do
  factory :donation do
    association :user, factory: :user
  end
end
