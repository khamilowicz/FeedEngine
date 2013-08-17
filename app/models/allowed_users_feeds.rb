class AllowedUsersFeeds < ActiveRecord::Base
  belongs_to :feed
  belongs_to :allowed_user, class_name: 'User', foreign_key: 'user_id'
end
