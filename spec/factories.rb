FactoryGirl.define do
  factory :book do
    title { Faker::Company.catch_phrase }
    description { Faker::Hacker.say_something_smart }
    cover_url { Faker::Avatar.image(nil, '100x200') }

    author
  end

  factory :author do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    biography { Faker::Lorem.paragraph(5) }
  end
end
