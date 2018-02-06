# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Room - Destroy and Create
Room.destroy_all
16.times do |index|
  Room.create!(number: index+1, floor: 'Térreo')
end
16.times do |index|
  Room.create!(number: index+1, floor: 'Piso Superior')
end

#Course - Destroy and Create
Course.destroy_all
20.times do
  Course.create!( name: Faker::Educator.unique.course )
end