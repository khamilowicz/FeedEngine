# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feed do
    user

    after(:create) do |feed|
      feed.subdomain = feed.user.nick.downcase 
    end

    trait :with_posts do 
      ignore do 
        post_number 1
      end

      after(:create) do |feed, evaluator|
        feed.posts << FactoryGirl.create_list(:post, evaluator.post_number)
      end
    end
  end
end
