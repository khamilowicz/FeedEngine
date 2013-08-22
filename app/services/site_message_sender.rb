class SiteMessageSender

  def self.send_message from_to
    sender = from_to[:from]
    receiver = from_to[:to]
    type = from_to[:type]

    message = Message.new content: from_to[:content], message_type: type.to_s
    message.sender = sender
    receiver.inbox << message
  end
  
end