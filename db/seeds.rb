# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


george = User.create(
  username: "george",
  email: "george@email.com",
  password: "password"
)

tabitha = User.create(
  username: "tabitha",
  email: "tabitha@email.com",
  password: "password"
)

dark_matter = Cafe.create(
  name: "Dark Matter Coffee",
  city: "Chicago", state: "IL",
  open_hour: 6,
  open_minute: "00",
  close_hour: 17,
  close_minute: "00",
  speciality: "muffins",
  table_chair_seating: true,
  cushioned_seating: false,
  outdoor_seating: false,
  wifi: true,
  food: true
)

foundation = Cafe.create(
  name: "Foundation Coffee Co",
  city: "Riverview",
  state: "FL",
  open_hour: 7,
  open_minute: "30",
  close_hour: 16,
  close_minute: "00",
  speciality: "Cappuccinos",
  table_chair_seating: true,
  cushioned_seating: true,
  outdoor_seating: true,
  wifi: true,
  food: false
)

daily_grind = Cafe.create(
  name: "Daily Grind Coffee Co.",
  city: "Apollo Beach",
  state: "FL",
  open_hour: 7,
  open_minute: "00",
  close_hour: 14,
  close_minute: "00"
)

cup_o_joe = Cafe.create(
  name: "Cup O Joe",
  city: "Columbus",
  state: "OH",
  open_hour: 6,
  open_minute: "30",
  close_hour: 18,
  close_minute: "00"
)

dark_matter_review = Review.create(
  cafe: dark_matter,
  user: tabitha,
  rating: 5,
  content: "Great place to study!"
)

cup_o_joe_review = Review.create(
  cafe: cup_o_joe,
  user: tabitha,
  rating: 5,
  content: "Love the black coffee!"
)

study = Category.create(name: "Studying")
casual = Category.create(name: "Casual")

dark_matter.categories << study
dark_matter.categories << casual
