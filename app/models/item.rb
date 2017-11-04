class Item < ApplicationRecord
  has_many :donation_items
  has_many :donations, through: :donation_items

  def self.sorted_items
    order(:name)
  end

  def self.find_item_ids(items)
    item_names = items.map { |item| item.item }
    where(name: item_names)
  end
end
