require 'securerandom'

class Donation < ApplicationRecord
  belongs_to :user
  has_many :donation_items
  has_many :items, through: :donation_items
  validates_presence_of :confirmation
  accepts_nested_attributes_for :items

  before_validation :generate_confirmation

  def generate_confirmation
    self.confirmation = SecureRandom.hex(8)
  end
end
