class DonationItemSerializer < ActiveModel::Serializer
  attributes :quantity, :item

  def item
    Item.find(object['item_id'])
  end
end
