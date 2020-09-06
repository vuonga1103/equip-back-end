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
  longitude: -73.976,
  latitude: 40.645,
  email: "anh@anh.com" 
)

fluffy = User.create(
  username: "fluffy",
  password: "fluffy",
  city: "Manhattan",
  state: "NY",
  zip: 10001, 
  longitude: -73.997,
  latitude: 40.751,
  email: "fluffy@fluffy.com" 
)

misty = User.create(
  username: "misty",
  password: "misty",
  city: "Bronx",
  state: "NY",
  zip: 10457, 
  longitude: -73.899,
  latitude: 40.847,
  email: "misty@misty.com" 
)

item1 = Item.create(
  name: "Wheelchair",
  description: "Standard hospital wheelchair 18' x 16'",
  condition: "Like New",
  price: 100,
  pickup: true,
  shipping: true,
  category: "Wheelchairs & Scooters",
  photo: "https://cdn.fsastore.com/ProductImages/Large/423104_1.jpg",
  sold: false,
  user: anh
)

item2 = Item.create(
  name: "Walker",
  description: "Front wheel walker, worn but can still be used with some adjustments",
  condition: "Worn",
  price: 0,
  pickup: true,
  shipping: false,
  category: "Walking Aids",
  photo: "https://images-na.ssl-images-amazon.com/images/I/71CkSkJeuDL.__AC_SY300_QL70_ML2_.jpg",
  sold: false,
  user: fluffy
)

item3 = Item.create(
  name: "Quad Cane",
  description: "Your average quad cane",
  condition: "Good",
  price: 10,
  pickup: false,
  shipping: true,
  category: "Walking Aids",
  photo: "https://cdns.webareacontrol.com/prodimages/1000-X-1000/2/e/24220171758Field-Lumex-Bariatric-Quad-Cane-L.png",
  sold: false,
  user: misty
)

item4 = Item.create(
  name: "Crutches",
  description: "New set of axillary crutches, still in original packaging",
  condition: "New",
  price: 10,
  pickup: true,
  shipping: true,
  category: "Walking Aids",
  photo: "https://www.performancehealth.com/media/wysiwyg/blog/articles/Days_Standard_Aluminum_Crutches.jpg",
  sold: false,
  user: misty
)

item4 = Item.create(
  name: "Hospital Bed Frame",
  description: "Good condition hospital bed frame",
  condition: "Good",
  price: 150,
  pickup: true,
  shipping: false,
  category: "Beds & Lifts",
  photo: "https://images-na.ssl-images-amazon.com/images/I/815xxE7TkAL._AC_SL1500_.jpg",
  sold: false,
  user: fluffy
)

item5 = Item.create(
  name: "Pediatric Wheelchair",
  description: "Green wheelchair, power, with charger",
  condition: "Good",
  price: 200,
  pickup: true,
  shipping: false,
  category: "Pediatrics",
  photo: "https://www.spinlife.com/images/product/40433.jpg",
  sold: false,
  user: anh
)



puts "SEEDING COMPLETED!"