# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Room - Destroy and Create
# Room.destroy_all
# 16.times do |index|
#   Room.create!(number: index+1, floor: 'Térreo')
# end
# 16.times do |index|
#   Room.create!(number: index+1, floor: 'Piso Superior')
# end
#
# #Course - Destroy and Create
# Course.destroy_all
# 20.times do
#   Course.create!(name: Faker::Educator.unique.course)
# end

# Create 100 users
room = 41
25.times do
  4.times do
    User.create!(
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(8, 16),
        name: Faker::Name.name,
        reg_number: Faker::Number.number(9),
        course_id: Faker::Number.between(21, 40),
        room_id: room
    )
  end
  room = room + 1
end