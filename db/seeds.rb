# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Item.destroy_all

anh = User.create(
  username: "anh",
  password: "anh",
  city: "Brooklyn",
  state: "NY",
  zip: 11218, 
  email: "anh@anh.com" 
)

fluffy = User.create(
  username: "fluffy",
  password: "fluffy",
  city: "Manhattan",
  state: "NY",
  zip: 10001, 
  email: "fluffy@fluffy.com" 
)

misty = User.create(
  username: "misty",
  password: "misty",
  city: "Bronx",
  state: "NY",
  zip: 10457, 
  email: "misty@misty.com" 
)

item1 = Item.create(
  name: "wheelchair",
  description: "standard hospital wheelchair 18 x 16",
  condition: "like new",
  price: 100,
  pickup: true,
  shipping: true,
  category: "Wheelchairs & Scooters",
  photo: "https://cdn.fsastore.com/ProductImages/Large/423104_1.jpg",
  sold: false,
  user: anh
)

item2 = Item.create(
  name: "walker",
  description: "front wheel walker, worn but can still be used with some adjustments",
  condition: "worn",
  price: 0,
  pickup: true,
  shipping: false,
  category: "Walking Aids",
  photo: "https://images-na.ssl-images-amazon.com/images/I/71CkSkJeuDL.__AC_SY300_QL70_ML2_.jpg",
  sold: false,
  user: fluffy
)

item3 = Item.create(
  name: "quad cane",
  description: "your average quad cane",
  condition: "good",
  price: 10,
  pickup: true,
  shipping: false,
  category: "Walking Aids",
  photo: "https://cdns.webareacontrol.com/prodimages/1000-X-1000/2/e/24220171758Field-Lumex-Bariatric-Quad-Cane-L.png",
  sold: false,
  user: misty
)


puts "SEEDING COMPLETED!"