# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create(name: "Boxcar Betty's", description: "Fried Chicken Sandwiches")

Item.create(name: "Fried Chicken Sandwich", price: 6.50, menu_id: 1)

Item.create(name: "Homemade French Fries" , price: 2.00, menu_id: 1)

Item.create(name: "Sweet Tea", price: 1.00, menu_id: 1)

Restaurant.create(name: "Ray's", description: "The Best Burgers", menu_id: 2)

Item.create(name: "Burger", price: 4.00, menu_id: 2)

Item.create(name: "Cheese Burger", price: 5.00, menu_id: 2)

Item.create(name: "Coke", price: 1.00, menu_id: 2)

Menu.create(name: "Boxcar Betty's", description: "Fried Chicken Sandwiches")

Menu.create(name: "Ray's", description: "Good Burgers")

Table.create(number: 1, restaurant_id: "1")
Table.create(number: 2, restaurant_id: "1")


Table.create(number: 1, restaurant_id: "2")
Table.create(number: 2, restaurant_id: "2")

RestaurantMenu.create(menu_id: 1, restaurant_id: 1)
RestaurantMenu.create(menu_id: 2, restaurant_id: 2)