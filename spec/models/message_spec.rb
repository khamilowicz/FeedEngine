require "spec_helper"

describe Message do
  it ".access_requests finds messages with type :access_request" do
    request = Message.create(message_type: 'access_request')
    other = Message.create(message_type: 'other')
    Message.access_requests.to_a.should include(request)
    Message.access_requests.to_a.should_not include(other)
  end
end