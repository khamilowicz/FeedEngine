class Feed < ActiveRecord::Base

  include Lockable

  belongs_to :user
  alias_attribute :owner, :user

  has_many :feeds_posts, class_name: 'FeedsPosts'
  has_many :posts, ->{ order("created_at DESC")}, through: :feeds_posts

  def total_points
    posts.sum(:points)
  end


end
