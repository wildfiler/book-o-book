# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Book.delete_all

50.times do
  Book.create(
    title: Faker::Company.catch_phrase,
    description: Faker::Hacker.say_something_smart,
    cover_url: Faker::Avatar.image(nil, '100x200')
  )
end
