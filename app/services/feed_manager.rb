module FeedManager

  def self.ask_for_access pleader, resource, sender = SiteMessageSender
    sender.send_message to: resource.owner, from: pleader, type: :access_request, content: resource
  end
end