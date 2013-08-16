
class Post < ActiveRecord::Base

  has_many :feeds_posts
  has_many :feeds, through: :feeds_posts
  belongs_to :user
end
