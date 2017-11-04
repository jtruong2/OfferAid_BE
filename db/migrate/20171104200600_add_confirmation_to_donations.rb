class AddConfirmationToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :confirmation, :string
  end
end
