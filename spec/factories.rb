FactoryGirl.define do
  factory :book do
    title { Faker::Company.catch_phrase }
    description { Faker::Hacker.say_something_smart }
    cover_url { Faker::Avatar.image(nil, '100x200') }
    published_at { Faker::Date.between(10.years.ago, 1.year.ago) }

    author
  end

  factory :author do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    biography { Faker::Lorem.paragraph(5) }
  end

  factory :list do
    title Faker::Company.catch_phrase
  end

  factory :user do
    email Faker::Internet.email
    password_digest Faker::Internet.password(8)
  end
end
