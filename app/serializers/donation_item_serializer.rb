class DonationItemSerializer < ActiveModel::Serializer
  attributes :quantity, :name

  def name
    Item.find(object.id)
  end
end
