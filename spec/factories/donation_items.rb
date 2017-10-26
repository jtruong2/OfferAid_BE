FactoryGirl.define do
  factory :donation_item do
    association :item, factory: :item
    association :donation, factory: :donation
    quantity 1
  end
end
