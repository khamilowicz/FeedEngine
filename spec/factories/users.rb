# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email){ |n| "John_Smith#{n}@gmail.com"}
    password 1234566789
    password_confirmation 1234566789
    first_name 'John'
    last_name "Smith"
    description "Just a humble bounty hunter"
    nick "Spike"
    age '24'
  end
end
