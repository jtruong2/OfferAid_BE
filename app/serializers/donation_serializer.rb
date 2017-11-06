class DonationSerializer < ActiveModel::Serializer
  attributes :id, :confirmation, :created_at, :pickup_date, :pickup_address, :confirmation

  has_many :items
  has_many :donation_items
end
