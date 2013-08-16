
class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :allowed_users_feeds
  has_many :allowed_users, through: :allowed_users_feeds, class_name: 'User'
  has_many :feeds_posts, class_name: 'FeedsPosts'
  has_many :posts, through: :feeds_posts
end
