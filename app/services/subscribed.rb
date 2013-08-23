module Subscribed

  def self.included receiver
    receiver.instance_eval do 
      has_many :subscribed_feeds, as: :subscribent
    end
  end

  def all_posts
    posts.to_a + subscribed.to_a
  end

  def subscribed
    subscribed_feeds.posts
  end

  def subscribe service, identifier
    subscribed_feeds.create( service: service, identifier: identifier)
  end

  def unsubscribe service, identifier    
    subscribed_feeds.where( service: service, identifier: identifier).delete_all
  end
end
