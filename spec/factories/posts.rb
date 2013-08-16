# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence(:title){ |n| "Posttitle#{n}"}
    sequence(:description){ |n| "Postdescription#{n}"}
  end
end
