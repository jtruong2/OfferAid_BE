class DonationItem < ApplicationRecord
  belongs_to :item
  belongs_to :donation
  validates_presence_of :quantity

  def self.create_association(donation_id, items)
    items.map do |item|
      create!(donation_id: donation_id, item_id: item.index, quantity: item.quantity)
    end
  end
end
