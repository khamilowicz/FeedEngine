class SubscribedFeed < ActiveRecord::Base
  belongs_to :subscribent, polymorphic: true

  def self.posts
    all.to_a.reduce([]) do |total_posts, subscription|
      total_posts +=Service.create( 
        subscription.service, subscription.identifier 
        ).posts
    end
  end

  def self.list
    all.to_a.collect{|sf| sf.identifier}
  end
end
