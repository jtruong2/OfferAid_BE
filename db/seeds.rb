items = ["Basic Phone", "Blanket", "Books", "Canned Goods", "Diapers", "First Aid Items", "Games/ Toys", "Misc Clothing Items", "Misc Electronic Items", "Misc Non-Perishable Foods", "Misc Paper Products", "Pants", "Paper Towel", "School Supplies", "Shirt", "Shoes", "Sleeping Bag", "Smart Phone", "Soft Drinks", "Tablet", "Toilet Paper", "Toiletries", "Water Bottle"]
items.map { |item| Item.create!(name: item)}
puts 'Items added'
