# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.delete_all
Author.delete_all
List.delete_all

10.times do
  author = Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    biography: Faker::Lorem.paragraph(5)
  )

  10.times do
    Book.create(
      title: Faker::Book.title,
      description: Faker::Hacker.say_something_smart,
      cover_url: Faker::Avatar.image(nil, '100x200'),
      author: author,
      published_at: Faker::Time.between(100.days.ago, Time.current)
    )
  end
end

3.times do
  List.create!(
    title: Faker::Book.title,
    books: Book.all.order('RANDOM()').limit(10)
  )
end

5.times do
  Genre.create!(
    name: Faker::Book.genre,
    books: Book.all.order('RANDOM()').limit(40)
  end
  
10.times do
  User.create!(
    email: Faker::Internet.email,
    password_digest: Faker::Internet.password(8)
  )
end

10.times do
  Review.create!(
    comment: Faker::Hacker.say_something_smart,
    user_id: Random.new.rand(1..10),
    book_id: Random.new.rand(1..50),
  )
end
