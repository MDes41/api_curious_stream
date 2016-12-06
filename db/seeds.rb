# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


2.times do 
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	user = User.create(	first_name: first_name,
											last_name: last_name,
											username: "#{first_name[0]}" + last_name,
											email: "#{first_name[0]}" + last_name + "@example.com")
	5.times do 
		Tweet.create(msg: Faker::Lorem.paragraph, likes: 0, user_id: user.id)
	end
end
