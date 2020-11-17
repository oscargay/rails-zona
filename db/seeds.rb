# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
puts "creating users"
usera = User.create! :first_name => 'Steve', :last_name => 'Jobs', :email => 'steve_jobs@apple.com', :password => 'topsecret', :password_confirmation => 'topsecret'
userb = User.create! :first_name => 'Jeff', :last_name => 'Bezos', :email => 'jeff_bezos@amazon.com', :password => 'bezostheboss', :password_confirmation => 'bezostheboss'
userc = User.create! :first_name => 'Elon', :last_name => 'Musk', :email => 'elon_musk@awesome.com', :password => 'spacex', :password_confirmation => 'spacex'

Equipment.destroy_all
puts "creating flats"
Equipment.create!(
  name: 'Bike',
  description: 'Nice bike!',
  category: 'Outdoor Sport',
  location: 'London',
  price: 5,
  user_id: usera.id
)
Equipment.create!(
  name: 'Treadmill',
  description: 'Run as fast as you can',
  category: 'Indoor Sport',
  location: 'Paris',
  price: 30,
  user_id: usera.id
)
Equipment.create!(
  name: 'Rails documentation',
  description: 'Nice to read',
  category: 'Brain Gym',
  location: 'Shoreditch',
  price: 1,
  user_id: userb.id
)
puts "Finished!"