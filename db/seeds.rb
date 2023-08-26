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

puts 'Destroying all'
Reservation.destroy_all
Cat.destroy_all
User.destroy_all

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
addresses = [
  "12 Rue de la Paix, Paris, 75002",
  "45 Avenue des Champs-Élysées, Paris, 75008",
  "8 Rue du Faubourg Saint-Honoré, Paris, 75008",
  "23 Rue de Rivoli, Paris, 75004",
  "17 Rue Montorgueil, Paris, 75001",
  "36 Quai des Orfèvres, Paris, 75001",
  "5 Rue de la Cité, Paris, 75004",
  "67 Rue de Rennes, Paris, 75006",
  "28 Boulevard Saint-Germain, Paris, 75005",
  "9 Rue de Vaugirard, Paris, 75006",
  "72 Rue du Faubourg Saint-Antoine, Paris, 75012",
  "14 Avenue de l'Opéra, Paris, 75001"
];
img_url = ["https://cdn2.thecatapi.com/images/e43.jpg",
  "https://cdn2.thecatapi.com/images/a3n.jpg",
  "https://cdn2.thecatapi.com/images/bbr.jpg",
  "https://cdn2.thecatapi.com/images/mp.jpg",
  "https://cdn2.thecatapi.com/images/171.jpg",
  "https://cdn2.thecatapi.com/images/bti.jpg",
  "https://cdn2.thecatapi.com/images/kh.jpg",
  "https://cdn2.thecatapi.com/images/MjA2NDUzMg.jpg",
  "https://cdn2.thecatapi.com/images/MjAzNzA4Mg.jpg",
  "https://cdn2.thecatapi.com/images/cnh.jpg",
  "https://cdn2.thecatapi.com/images/vH0bd0YDH.jpg",
  "https://cdn2.thecatapi.com/images/3a8.jpg",
  "https://cdn2.thecatapi.com/images/bGUQ04k2E.jpg",
  "https://cdn2.thecatapi.com/images/74s.jpg",
  "https://cdn2.thecatapi.com/images/c8.jpg",
  "https://cdn2.thecatapi.com/images/4cq.gif",
  "https://cdn2.thecatapi.com/images/j9_ETlBMp.jpg",
  "https://cdn2.thecatapi.com/images/b89.jpg",
  "https://cdn2.thecatapi.com/images/83r.gif",
  "https://cdn2.thecatapi.com/images/MTc4NDg3Nw.png",
  "https://cdn2.thecatapi.com/images/cgc.jpg",
  "https://cdn2.thecatapi.com/images/sxIXJax6h.jpg",
  "https://cdn2.thecatapi.com/images/ase.jpg",
  "https://cdn2.thecatapi.com/images/bgv.jpg",
  "https://cdn2.thecatapi.com/images/9pn.jpg",
  "https://cdn2.thecatapi.com/images/yZE2JpeXz.jpg",
  "https://cdn2.thecatapi.com/images/4ml.jpg",
  "https://cdn2.thecatapi.com/images/9qh.jpg",
  "https://cdn2.thecatapi.com/images/ftmw29QPb.jpg",
  "https://cdn2.thecatapi.com/images/9ad.jpg",
  "https://cdn2.thecatapi.com/images/MTgxNzkxMQ.jpg",
  "https://cdn2.thecatapi.com/images/2d6.jpg",
  "https://cdn2.thecatapi.com/images/MTcwMTgxMg.jpg",
  "https://cdn2.thecatapi.com/images/MTkzMDM2MQ.jpg",
  "https://cdn2.thecatapi.com/images/ar2.jpg",
  "https://cdn2.thecatapi.com/images/67j.png",
  "https://cdn2.thecatapi.com/images/csc.jpg",
  "https://cdn2.thecatapi.com/images/MjAxMzk4OQ.jpg",
  "https://cdn2.thecatapi.com/images/4vr.jpg",
  "https://cdn2.thecatapi.com/images/c3s.jpg",
  "https://cdn2.thecatapi.com/images/b7h.jpg",
  "https://cdn2.thecatapi.com/images/MTc1NTg5OA.jpg",
  "https://cdn2.thecatapi.com/images/ao2.jpg",
  "https://cdn2.thecatapi.com/images/a2u.jpg",
  "https://cdn2.thecatapi.com/images/2f6.jpg"]




puts 'Creating 10 users'
10.times do
  user = User.create!(first_name: Faker::Name.first_name, address:addresses.sample, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'azerty', image_url: Faker::Avatar.image)

  puts user.first_name
end
puts ''
puts '10 users created'

puts 'Creating 12 cats'
addresses.each do |address|
  a = addresses.index(address)

  cat_user = User.all.sample
  cat = Cat.create!(user: cat_user, name: Faker::Creature::Animal.name, age: rand(1..20), sexe: ['Male', 'Female'].sample, race: cat_breeds.sample, location: address, description: Faker::Lorem.paragraph, price: rand(5..50), images_url: [img_url[(a * 3)], img_url[(a * 3) + 1], img_url[(a * 3) + 2]])
  puts cat.name
end
puts ''
puts '12 cats created'

puts 'Creating resa'
today = Date.today



5.times do

  user = User.all.sample
  cat = Cat.all.sample
  if user.id == cat.user_id
    return
  else
    random_days = rand(0..30)
    random_date = today + random_days
    reservation = Reservation.create!(user: user, cat: cat, start_date: random_date, end_date: (random_date + 3), total_price: (cat.price * 3))
    puts reservation.cat.name
  end
end
puts ''
puts '5 resa created'
