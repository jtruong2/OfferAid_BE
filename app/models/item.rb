class Item < ApplicationRecord
  has_many :donation_items
  has_many :donations, through: :donation_items

  def self.find_or_create(params)
    find_or_create_by(name: params["name"]) do |item|
      item.name = params["name"]
    end
  end
end
