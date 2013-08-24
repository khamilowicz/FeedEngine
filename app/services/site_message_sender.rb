class SiteMessageSender

  def self.send_message message

    message[:to].inbox << Message.new(
      content: message[:content], 
      message_type: message[:type], 
      sender: message[:from])
  end
  
end