class Message < ActiveRecord::Base
  belongs_to :sender, polymorphic: true
  belongs_to :receiver, polymorphic: true

  scope :access_requests, ->{ where(message_type: 'access_request')}
end