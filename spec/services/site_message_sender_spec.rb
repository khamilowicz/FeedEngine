require "spec_helper"

describe SiteMessageSender do

  let(:user_1){ FactoryGirl.create(:user)}
  let(:user_2){ FactoryGirl.create(:user)}

  before(:each) do
    class User
      include Messengable
    end
  end

  it "sends messages between two messengable entities" do
    SiteMessageSender.send_message({from: user_1, 
      to: user_2,
      type: :message, 
      content: "Simple message"})
    user_2.inbox.where(sender: user_1).first.content.should == "Simple message"
  end

  it "sends access request between two messengable entities" do
        SiteMessageSender.send_message({from: user_1, 
      to: user_2,
      type: :access_request, 
      content: 'feed'})
    user_2.inbox.access_requests.first.content.should == "feed"
  end
end