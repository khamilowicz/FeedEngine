class Message < ActiveRecord::Base
  belongs_to :sender, polymorphic: true
  belongs_to :receiver, polymorphic: true

  scope :access_requests, ->{ where(message_type: 'access_request')}

  ## TODO: this scope stinks, but alternative is to loop over every record. Maybe just not allow arrays?
  scope :access_pleaders, ->(sender){ senders = Array(sender);
                       access_requests.where(sender_id: senders.map(&:id), 
                        sender_type: senders.first.class) }
end