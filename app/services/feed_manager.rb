module FeedManager

  def self.ask_for_access pleader, resource, sender = SiteMessageSender
    sender.send to: resource.owner, from: pleader
  end
end