# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Item.destroy_all

annie = User.create(
  username: "annie",
  password: "annie",
  city: "Brooklyn",
  state: "NY",
  zip: '11218', 
  longitude: -73.976,
  latitude: 40.645,
  email: "annie@annie.com" 
)

fluffy = User.create(
  username: "fluffy",
  password: "fluffy",
  city: "Philadelphia",
  state: "PA",
  zip: '19102', 
  longitude: -75.166,
  latitude: 39.953,
  email: "fluffy@fluffy.com" 
)

misty = User.create(
  username: "misty",
  password: "misty",
  city: "Queens",
  state: "NY",
  zip: '11435', 
  longitude: -73.810,
  latitude: 40.700,
  email: "misty@misty.com" 
)

pepe = User.create(
  username: "pepe",
  password: "pepe",
  city: "Queens",
  state: "NY",
  zip: '11435', 
  longitude: -73.810,
  latitude: 40.700,
  email: "pepe@pepe.com" 
)

waddle = User.create(
  username: "waddle",
  password: "waddle",
  city: "Staten Island",
  state: "NY",
  zip: '10453', 
  longitude: -74.090,
  latitude: 40.608,
  email: "waddle@waddle.com" 
)

muffin = User.create(
  username: "muffin",
  password: "muffin",
  city: "Stony Brook",
  state: "NY",
  zip: '11733', 
  longitude: -73.107,
  latitude: 40.932,
  email: "muffin@muffin.com" 
)

biscuit = User.create(
  username: "biscuit",
  password: "biscuit",
  city: "Queens",
  state: "NY",
  zip: '11733', 
  longitude: -73.939,
  latitude: 40.745,
  email: "biscuit@biscuit.com" 
)

heap = User.create(
  username: "heap",
  password: "heap",
  city: "Montauk",
  state: "NY",
  zip: '11954', 
  longitude: -71.951,
  latitude: 41.038,
  email: "heap@heap.com" 
)

ollie = User.create(
  username: "ollie",
  password: "ollie",
  city: "Tobyhanna",
  state: "PA",
  zip: '18344', 
  longitude: -75.355,
  latitude: 41.118,
  email: "ollie@ollie.com" 
)

wallie = User.create(
  username: "wallie",
  password: "wallie",
  city: "White Plains",
  state: "NY",
  zip: '10606', 
  longitude: -73.778,
  latitude: 41.024,
  email: "wallie@wallie.com" 
)


annie_item1 = Item.create(
  name: "Wheelchair",
  description: "Standard hospital wheelchair 18' x 16'",
  condition: "Like New",
  price: 100,
  pickup: true,
  shipping: true,
  category: "Wheelchairs & Scooters",
  photo: "https://cdn.fsastore.com/ProductImages/Large/423104_1.jpg",
  sold: false,
  user: annie
)

annie_item2 = Item.create(
  name: "Lightweight Wheelchair",
  description: "Simple green lightweight wheelchair, ideal for active folks",
  condition: "Good",
  price: 200,
  pickup: true,
  shipping: false,
  category: "Wheelchairs & Scooters",
  photo: "https://www.spinlife.com/images/product/40433.jpg",
  sold: false,
  user: annie
)

fluffy_item1 = Item.create(
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

fluffy_item2 = Item.create(
  name: "Bed Frame",
  description: "Good condition hospital bed frame, adjustable",
  condition: "Good",
  price: 150,
  pickup: true,
  shipping: false,
  category: "Beds & Lifts",
  photo: "https://images-na.ssl-images-amazon.com/images/I/815xxE7TkAL._AC_SL1500_.jpg",
  sold: false,
  user: fluffy
)

misty_item1 = Item.create(
  name: "Quad Cane",
  description: "Your average quad cane",
  condition: "Good",
  price: 10,
  pickup: true,
  shipping: false,
  category: "Walking Aids",
  photo: "https://cdns.webareacontrol.com/prodimages/1000-X-1000/2/e/24220171758Field-Lumex-Bariatric-Quad-Cane-L.png",
  sold: false,
  user: misty
)

misty_item2 = Item.create(
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

pepe_item1 = Item.create(
  name: "Forearm Crutches",
  description: "Worn forearm crutches but usable",
  condition: "Worn",
  price: 0,
  pickup: true,
  shipping: false,
  category: "Walking Aids",
  photo: "https://images-na.ssl-images-amazon.com/images/I/61Qyu0zKAvL._AC_SL1500_.jpg",
  sold: false,
  user: pepe
)

pepe_item2 = Item.create(
  name: "Hoyer Lift",
  description: "Mobility tool to help seniors with mobility challenges get out of bed",
  condition: "Good",
  price: 350,
  pickup: true,
  shipping: false,
  category: "Beds & Lifts",
  photo: "https://www.spinlife.com/images/product/49796.png",
  sold: false,
  user: pepe
)

waddle_item1 = Item.create(
  name: "Reverse Walker",
  description: "Reverse Walker for Kids",
  condition: "Good",
  price: 30,
  pickup: true,
  shipping: true,
  category: "Pediatrics",
  photo: "https://advanceddmesupplies.com/wp-content/uploads/2018/08/Reverse-Walker.jpg",
  sold: false,
  user: waddle
)

waddle_item2 = Item.create(
  name: "Communication Device",
  description: "Can be activated by pressing one of eight message squares and has a total record time of 300 seconds",
  condition: "Like New",
  price: 50,
  pickup: true,
  shipping: true,
  category: "Pediatrics",
  photo: "https://enablingdevices.com/wp-content/uploads/2017/02/1391.2017-1.jpg",
  sold: false,
  user: waddle
)

muffin_item1 = Item.create(
  name: "Universal Cuff",
  description: "Fits various utensils",
  condition: "Good",
  price: 5,
  pickup: true,
  shipping: true,
  category: "Other",
  photo: "https://images-na.ssl-images-amazon.com/images/I/51q6zqRN4gL._AC_.jpg",
  sold: false,
  user: muffin
)

muffin_item2 = Item.create(
  name: "Button Hook",
  description: "Allows for one-hand dressing",
  condition: "Like New",
  price: 0,
  pickup: true,
  shipping: true,
  category: "Other",
  photo: "https://cdn.webshopapp.com/shops/70721/files/252543965/800x600x2/button-hook-with-thickened-handle.jpg",
  sold: false,
  user: muffin
)


biscuit_item1 = Item.create(
  name: "Rocker Knife",
  description: "Allows for one-hand cutting with ease",
  condition: "Like New",
  price: 5,
  pickup: true,
  shipping: true,
  category: "Other",
  photo: "https://image.rehabmart.com/include-mt/img-resize.asp?path=/productimages/nc28237_lg_rocker_t_kife.jpg&maxheight=500&width=640&quality=80",
  sold: false,
  user: biscuit
)


biscuit_item2 = Item.create(
  name: "Tub Bench",
  description: "New tub bench not yet assembled",
  condition: "New",
  price: 30,
  pickup: false,
  shipping: true,
  category: "Bath & Shower",
  photo: "https://images.homedepot-static.com/productImages/1e841e7f-5327-48b0-9707-570087daaf65/svn/gray-drive-shower-chairs-12011kd-1-64_1000.jpg",
  sold: false,
  user: biscuit
)

heap_item1 = Item.create(
  name: "Sports Wheelchair",
  description: "Great for adaptive sports like tennis or basketball",
  condition: "Good",
  price: 200,
  pickup: true,
  shipping: false,
  category: "Wheelchairs & Scooters",
  photo: "https://www.spinlife.com/images/product/61596.png",
  sold: false,
  user: heap
)

heap_item2 = Item.create(
  name: "Typing Aid",
  description: "Good for quadriplegic folks with limited finger movement",
  condition: "Good",
  price: 0,
  pickup: true,
  shipping: false,
  category: "Other",
  photo: "https://www.allegromedical.com/images/productImages/CA/3A/qualcare-clear-view-typing-aid-hand-typer-right-209526-MEDIUM_0.jpg",
  sold: false,
  user: heap
)

ollie_item1 = Item.create(
  name: "Scooter",
  description: "Power scooter with basket, great for seniors",
  condition: "Good",
  price: 275,
  pickup: true,
  shipping: false,
  category: "Wheelchairs & Scooters",
  photo: "https://images-na.ssl-images-amazon.com/images/I/91TQG1HJpLL._AC_SL1500_.jpg",
  sold: false,
  user: ollie
)

ollie_item2 = Item.create(
  name: "Rollator Walker",
  description: "Worn Rollator, needs some tightening",
  condition: "Worn",
  price: 20,
  pickup: true,
  shipping: true,
  category: "Walking Aids",
  photo: "https://images-na.ssl-images-amazon.com/images/I/81HsAtia%2BbL._AC_SL1500_.jpg",
  sold: false,
  user: ollie
)

wallie_item2 = Item.create(
  name: "Laser Cane",
  description: "Great for folks with Parkinson's Disease",
  condition: "Like New",
  price: 45,
  pickup: true,
  shipping: false,
  category: "Walkind Aids",
  photo: "https://www.ustep.com/wp-content/uploads/2017/12/laser-cane.jpg",
  sold: false,
  user: wallie
)

wallie_item2 = Item.create(
  name: "Ankle Foot Orthosis",
  description: "7 in' good for someone with foot drop",
  condition: "Good",
  price: 10,
  pickup: true,
  shipping: true,
  category: "Other",
  photo: "https://www.activeforever.com/media/catalog/product/cache/1/image/600x/17f82f742ffe127f42dca9de82fb58b1/0/0/0032130_ankle-foot-orthosis-semi-rigid-afo.jpeg",
  sold: false,
  user: wallie
)




puts "SEEDING COMPLETED!"