FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email 'foo@bar.tld'
    password 'foobar'
  end
end