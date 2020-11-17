# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create! :first_name => 'Steve', :last_name => 'Jobs', :email => 'steve_jobs@apple.com', :password => 'topsecret', :password_confirmation => 'topsecret'

Equipment.destroy_all

5.times do
  equipment = Equipment.new(name: "Bike", description: "Nice bike!", price: 5, location: "London", category: "Outdoor Sport")
  equipment.user_id = user.id
  equipment.save!
end
