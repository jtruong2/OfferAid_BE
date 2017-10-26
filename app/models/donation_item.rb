class DonationItem < ApplicationRecord
  belongs_to :item
  belongs_to :donation
  validates_presence_of :quantity
end
