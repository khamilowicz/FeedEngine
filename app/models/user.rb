class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :feeds
  has_many :posts, through: :feeds

  after_create :create_feed

  def main_feed
    feeds.first
  end

  def add_to_main_feed post
    main_feed.posts << post
  end

  private 

  def create_feed
    feeds.create
  end
end
