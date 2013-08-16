
class Post < ActiveRecord::Base

  has_many :feeds_posts
  has_many :feeds, through: :feeds_posts
  belongs_to :user

  paginates_per 10

  def add_points
    self.points+=1
  end
end
