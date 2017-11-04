FactoryGirl.define do
  factory :donation do
    association :user, factory: :user
    pickup_date '11/2/12'
    pickup_address '123'
  end
end
