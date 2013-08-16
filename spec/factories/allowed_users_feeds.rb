# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :allowed_users_feed, :class => 'AllowedUsersFeeds' do
    user_id 1
    feed_id 1
  end
end
