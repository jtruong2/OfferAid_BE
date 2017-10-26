class CreateDonationItems < ActiveRecord::Migration[5.1]
  def change
    create_table :donation_items do |t|
      t.references :item, foreign_key: true
      t.references :donation, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
