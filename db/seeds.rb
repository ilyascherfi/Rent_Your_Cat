# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"
require 'faker'
cat_breeds = [
  "Abyssinian",
  "American Shorthair",
  "Bengal",
  "British Shorthair",
  "Maine Coon",
  "Persian",
  "Ragdoll",
  "Siamese",
  "Sphynx",
  "Scottish Fold",
  "Russian Blue",
  "Savannah",
  "Burmese",
  "Himalayan",
  "Turkish Van",
  "Norwegian Forest Cat",
  "Devon Rex",
  "Cornish Rex",
  "Exotic Shorthair",
  "Somali"
]


puts 'Destroying all'
User.destroy_all
Cat.destroy_all
Reservation.destroy_all

puts 'Creating 50 users'
50.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'azerty', address: Faker::Address.full_address, image_url: Faker::Avatar.image)
  puts user.first_name
end
puts ''
puts '50 users created'

puts 'Creating 100 cats'
100.times do
  url = 'https://api.thecatapi.com/v1/images/search'
  cat_serialized = URI.open(url).read
  cat = JSON.parse(cat_serialized)
  image_url = cat[0]["url"]
  cat_user = User.all.sample
  cat = Cat.create!(user: cat_user, name: Faker::Creature::Animal.name, age: rand(1..20), sexe: ['male', 'female'].sample, race: cat_breeds.sample, location: cat_user.address, description: Faker::Lorem.paragraph, price: rand(5..50), image_url: image_url)
  puts cat.name
end
puts ''
puts '100 cats created'

puts 'Creating 50 resa'
today = Date.today

50.times do
  user = User.all.sample
  cat = Cat.all.sample
  if user.id == cat.user_id
    return
  else
    random_days = rand(1..30)
    random_date = today + random_days
    reservation = Reservation.create!(user: user, cat: cat, start_date: random_date, end_date: (random_date + 3), statut: false, total_price: cat.price * 3)
    puts reservation.cat.name
  end
end
puts ''
puts '50 resa created'
