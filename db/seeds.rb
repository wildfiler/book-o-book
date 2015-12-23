# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.delete_all
Author.delete_all

10.times do
  author = Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    biography: Faker::Lorem.paragraph(5)
  )

  10.times do
    Book.create(
      title: Faker::Company.catch_phrase,
      description: Faker::Hacker.say_something_smart,
      cover_url: Faker::Avatar.image(nil, '100x200'),
      author: author,
      published_at: Faker::Time.between(DateTime.now.current - 100, DateTime.now.current)
    )
  end
end
