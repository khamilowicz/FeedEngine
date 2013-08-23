module Subscribed

def self.included receiver
  receiver.instance_eval do 
    has_many :subscribed_feeds, as: :subscribent
  end
end

  def subscribed
    subscribed_feeds.to_a.map do |subscription|
      Service.create subscription.service, subscription.identifier
    end.map(&:posts).flatten
  end

  def subscribe service, identifier
    subscribed_feeds.create( service: service, identifier: identifier)
  end

  def unsubscribe service, identifier    
    subscribed_feeds.where( service: service, identifier: identifier).delete_all
  end

  def render_services
    subscribed_feeds.each do |service|
      Service.create(service).render
    end
  end
end
