# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscribed_feed do
    service "MyString"
    identifier "MyString"
  end
end
