# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Destroying all'
User.destroy_all
Cat.destroy_all
Reservation.destroy_all

puts 'Creating user'
user = User.create(first_name: 'Thib', last_name: 'Chss', email: 'thib@gmail.com', password: 'azerty', address: 'Paris')

puts 'Creating cat'
cat = Cat.create(user: User.first, name: 'Croquette', age: 2, sexe: 'Male', race: 'Bingual', location: 'Paris', description: 'Il est pas fun', price: 15)

puts 'Creating date'
start_date = Date.today
end_date = start_date + 3

puts 'Creating resa'
reservation = Reservation.create!(user: User.first, cat: Cat.first, start_date: start_date, end_date: end_date, statut: false, total_price: 50)
