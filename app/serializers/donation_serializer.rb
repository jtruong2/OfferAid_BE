class DonationSerializer < ActiveModel::Serializer
  attributes :id, :confirmation, :created_at

  has_many :items
  has_many :donation_items
end
