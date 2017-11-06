items = ["Basic Phone", "Blanket", "Books", "Canned Goods", "Diapers", "First Aid Items", "Games/ Toys", "Misc Clothing Items", "Misc Electronic Items", "Misc Non-Perishable Foods", "Misc Paper Products", "Pants", "Paper Towel", "School Supplies", "Shirt", "Shoes", "Sleeping Bag", "Smart Phone", "Soft Drinks", "Tablet", "Toilet Paper", "Toiletries", "Water Bottle"]
items.map { |item| Item.create!(name: item)}

puts 'Items added'

user1 = User.create!(first_name: 'Jimmy', last_name: 'Truong', street_address: '123 Main Street', city: 'Denver', state: 'CO', zip_code: '80202', email: 'jtruong2@comcast.net', password: 'password')
user2 = User.create!(first_name: 'default', last_name: 'default', street_address: '123 Main Street', city: 'Denver', state: 'CO', zip_code: '80202', email: '123', password: '123')

puts 'Users added'


donation = Donation.create!(user_id: user1.id, pickup_date: '12/12/12', pickup_address: '123 Main Street', confirmation: '')
DonationItem.create(donation_id: donation.id, item_id: 1, quantity: 4)
DonationItem.create(donation_id: donation.id, item_id: 4, quantity: 2)
DonationItem.create(donation_id: donation.id, item_id: 6, quantity: 5)

donation = Donation.create!(user_id: user2.id, pickup_date: '12/12/12', pickup_address: '123 Main Street', confirmation: '')
DonationItem.create(donation_id: donation.id, item_id: 1, quantity: 4)
DonationItem.create(donation_id: donation.id, item_id: 4, quantity: 2)
DonationItem.create(donation_id: donation.id, item_id: 6, quantity: 5)
