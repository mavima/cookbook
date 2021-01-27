# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Starting seed"

Recipe.destroy_all
User.destroy_all

puts "Models destroyed"

user1 = User.create!(email: "user1@a.a", password: "password", Firstname: "Emilie", Lastname: "Moulin")
user2 = User.create!(email: "user2@a.a", password: "password", Firstname: "Marta", Lastname: "Sanchez")
admin = User.create!(email: "pit@mail.com", password: "password", Firstname: "Pit", Lastname: "Muller", admin: true)

puts "Users created"

soup = Recipe.create(name: "Soupy soup", description: "Wonderful dish for cold days", instruction: "Stir and cook for two hours", user_id: 1, remote_photo_url: "https://images.unsplash.com/photo-1594756202469-9ff9799b2e4e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=635&q=80")
cake = Recipe.create(name: "Choco Croustillant Cake", description: "Crunchy layer between chocolate mousse and raspberries", instruction: "Combine dough, mousse and crust", user_id: 1, remote_photo_url: "https://images.unsplash.com/photo-1605291445244-9ff5e28a5376?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80")
tacos = Recipe.create(name: "Veggie tacos", description: "Healthy but tasty Mexican dish", instruction: "Fry the veggies on a pan and roll inside the tortilla with guacamole", user_id: 1, remote_photo_url: "https://images.unsplash.com/photo-1552332386-f8dd00dc2f85?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80")

puts "Seeding ready"


#
#
#
