# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
puts "Creating users..."

usera = User.create! :first_name => 'Steve', :last_name => 'Jobs', :email => 'steve_jobs@apple.com', :password => 'topsecret', :password_confirmation => 'topsecret'
userb = User.create! :first_name => 'Jeff', :last_name => 'Bezos', :email => 'jeff_bezos@amazon.com', :password => 'topsecret', :password_confirmation => 'topsecret'
userc = User.create! :first_name => 'Elon', :last_name => 'Musk', :email => 'elon_musk@awesome.com', :password => 'topsecret', :password_confirmation => 'topsecret'

Equipment.destroy_all
puts "Creating equipment"

@equipment = [
  { name: "Moutain Bike", description: "Bicycle designed for off-road cycling", category: "Outdoor activities", location: "Camden London", price: "10", user_id: usera.id },
  { name: "Tent 1pers.", description: "Package Includes: 1 Man Tent 1 roll out mat 1 sleeping bag", category: "Outdoor activities", location: "Greenwich London", price: "15", user_id: userb.id },
  { name: "Sleeping bag", description: "These are comfortable sleeping bags for use in base camp", category: "Outdoor activities", location: "Hackney London", price: "5", user_id: userc.id },
  { name: "Multi-Sport GPS Watch", description: "Companion designed to help you maximise your potential in any outdoor pursuit.", category: "Outdoor activities", location: "Hammersmith London", price: "20", user_id: usera.id },
  { name: "Helmet", description: "Bicycle Helmet, adult size", category: "Outdoor activities", location: "Islington London", price: "5", user_id: userb.id },
  { name: "Winter boots", description: "Size: UK 4", category: "Winter sports", location: "Kensington London", price: "5", user_id: userc.id },
  { name: "Ski helmet", description: "Size: 51-55cm", category: "Winter sports", location: "Chelsea London", price: "5", user_id: usera.id },
  { name: "Skis", description: "Includes: Skis and poles", category: "Winter sports", location: "Lambeth London", price: "15", user_id: userb.id },
  { name: "Snowboard", description: "Includes: Snowboard and boots", category: "Winter sports", location: "Lewisham London", price: "20", user_id: userc.id },
  { name: "Snow spikes", description: "They're perfect for walking over icy terrain", category: "Winter sports", location: "Southwark London", price: "5", user_id: usera.id },
  { name: "Wakeboard", description: "A short board with foot bindings", category: "Water sports", location: "Southwark London", price: "15", user_id: userb.id },
  { name: "Water Skis", description: "Pair of skis", category: "Water sports", location: "Tower Hamlets London", price: "10", user_id: userc.id },
  { name: "Mask And Snorkel", description: "Includes: mask, snorkel with splash guard, snorkel keeper and purge valve.", category: "Water sports", location: "Wandsworth London", price: "15", user_id: usera.id },
  { name: "Wetsuit", description: "Highest quality 3 mm CR neoprene", category: "Water sports", location: "Westminster London", price: "10", user_id: userb.id },
  { name: "Inflatable Paddle Board", description: "A great looking all round 10'6 x 6'' inflatable paddle board", category: "Water sports", location: "Barking London", price: "30", user_id: userc.id },
  { name: "Badminton Racket", description: "A junior racket designed for the 13-15 age group", category: "Indoor activities", location: "Barnet London", price: "10", user_id: usera.id },
  { name: "Yoga mat", description: "12mm Thickness", category: "Indoor activities", location: "Bexley London", price: "5", user_id: userb.id },
  { name: "Half ball dome", description: "Gym tool for building strength and stability.", category: "Indoor activities", location: "Brent London", price: "10", user_id: userc.id },
  { name: "Indoor shoes", description: "Size: UK 5", category: "Indoor activities", location: "Bromley London", price: "5", user_id: usera.id },
  { name: "Treadmill", description: "Ideal for running enthusiasts hoping to upgrade their workout at home", category: "Indoor activities", location: "Croydon London", price: "20", user_id: userb.id },
  { name: "12 clubs set", description: "Includes: Stand Bag, mallet putter, 12 clubs", category: "Golf", location: "Ealing London", price: "10", user_id: userc.id },
  { name: "Wooden tees", description: "100 tees. Length: 42mm", category: "Golf", location: "Enfield London", price: "5", user_id: usera.id },
  { name: "Umbrella", description: "Used while on the golf course", category: "Golf", location: "Haringey London", price: "5", user_id: userb.id },
  { name: "Caddy", description: "Nice guy who carries your bag and clubs", category: "Golf", location: "Harrow London", price: "50", user_id: userc.id },
  { name: "Golf cart", description: "Can carry two golfers and their golf clubs around a golf course", category: "Golf", location: "Havering London", price: "50", user_id: usera.id }
]

path = Rails.root.join('equipment_images').to_s
i = 0
dir_array = []
Dir.foreach(path) do |dir|
  next unless dir.match?(/(\d)/)
  num = dir.match(/(\d)/)[1].to_i
  dir_array << dir
end
dir_array.sort!
dir_array.each do |dir|
  if dir.include?('images') && @equipment[i].present?
    equipment = Equipment.create! @equipment[i]
    puts "#{i + 1}. Equipment \"#{equipment.name}\" created"
    puts "Directory: #{dir}"
    images_to_attach = []
    Dir.foreach(File.join(path, dir)) do |file|
      if file.include?('.jpg')
        puts "File: #{file}"
        uploaded_file = Cloudinary::Uploader.upload(File.join(path, dir, file))
        images_to_attach << { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/jpg' }
        puts 'Uploaded!'
      elsif file.include?('.png')
        puts "File: #{file}"
        uploaded_file = Cloudinary::Uploader.upload(File.join(path, dir, file))
        images_to_attach << { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/png' }
        puts 'Uploaded!'
      end
    end
    equipment.update!(photos: images_to_attach)
    puts "Images attached!"
    i += 1
  end
end

puts "Finished!"