# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

puts "Cleaning database..."
Eventspace.destroy_all
User.destroy_all

user2 = User.create!({ email: "ineslumo@gmail.com", password: "ines1234" })
user = User.create!({ email: "marnielumo@gmail.com", password: "marnie1234" })
users = [user2, user]
p users.sample
chosen_user = users.sample

# 10.times do
#   event = Eventspace.create!({
#     name: Faker::Restaurant.name,
#     address: Faker::Address.full_address,
#     user: chosen_user
#   })
#   puts "#{user.email} created #{event.name}successfully"
# end

file = URI.open("https://tourscanner.com/blog/wp-content/uploads/2019/05/Pena-Palace-tickets-1.png")
event = Eventspace.new(
      name: Faker::Restaurant.name,
      address: Faker::Address.full_address,
      user: chosen_user
    )
event.photos.attach(io: file, filename: "event.png", content_type: "image/png")
event.save
puts "#{user.email} created #{event.name}successfully"
