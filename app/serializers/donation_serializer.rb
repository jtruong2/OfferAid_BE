class DonationSerializer < ActiveModel::Serializer
  attributes :id

  has_many :items
  has_many :donation_items
end
