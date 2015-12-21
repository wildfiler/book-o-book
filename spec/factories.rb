FactoryGirl.define do
  factory :book do
    title { Faker::Company.catch_phrase }
    description { Faker::Hacker.say_something_smart }
    cover_url { Faker::Avatar.image(nil, '100x200') }
  end
end
