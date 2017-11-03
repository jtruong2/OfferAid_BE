class AddPickupDateAndPickupAddressToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :pickup_date, :string
    add_column :donations, :pickup_address, :string
  end
end
