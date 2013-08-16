
class Post < ActiveRecord::Base

  has_many :feeds_posts, class_name: 'FeedsPosts'
  has_many :feeds, through: :feeds_posts 

  paginates_per 10


  def add_points
    self.points+=1
  end

  def user
    main_feed.user
  end

  def main_feed
    self.feeds.first
  end
end
