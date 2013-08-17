class Feed < ActiveRecord::Base

  include Lockable

  belongs_to :user
  
  has_many :feeds_posts, class_name: 'FeedsPosts'
  has_many :posts, ->{ order("created_at DESC")}, through: :feeds_posts

end
