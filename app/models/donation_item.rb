class DonationItem < ApplicationRecord
  belongs_to :item
  belongs_to :donation
  validates_presence_of :quantity

  def self.create_association(donation_id, items)
    items.map do |item|
      create!(donation_id: donation_id, item_id: item['id'], quantity: item['quantity'])
    end
  end

  def self.get_count(user)
    user.donation_items.pluck(:quantity).reduce(:+)
  end

end
