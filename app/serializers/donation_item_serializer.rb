class DonationItemSerializer < ActiveModel::Serializer
  attributes :quantity, :item

  def item
    Item.find(object['donation_id'])
  end
end
