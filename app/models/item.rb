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

  def self.convert_from_voice(items)
    items_as_obj = []
    items_with_quantity = items.split(' ').each_slice(2).to_a
    items_with_quantity.map do |item|
      item_obj = {}
      item_obj['id'] = Item.find_by(name: item[1].capitalize).id
      item_obj['quantity'] = item[0].to_i
      item_obj['name'] = item[1]
      items_as_obj.push(item_obj)
    end
    return items_as_obj
  end
end
