class Donation < ApplicationRecord
  belongs_to :user
  has_many :donation_items
  has_many :items, through: :donation_items
end
