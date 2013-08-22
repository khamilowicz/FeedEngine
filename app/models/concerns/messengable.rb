module Messengable

  def self.included receiver
    receiver.instance_eval do 
      has_many :messages,  as: :sender
      has_many :inbox, as: :receiver, class_name: 'Message'
    end
  end
end