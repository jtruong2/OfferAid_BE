class DonationItemSerializer < ActiveModel::Serializer
  attributes :quantity, :item

  def item
    Item.find(object.id)
  end
end
