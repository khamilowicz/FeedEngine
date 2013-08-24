module SubscriptionService

  class << self

    def create params
      user, feed = params[:user], params[:feed]
      user.main_feed.subscribe :feedEngine, feed.subdomain
    end
  end
  
end
