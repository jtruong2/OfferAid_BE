class Item < ApplicationRecord
  has_many :donation_items
  has_many :donations, through: :donation_items
end
