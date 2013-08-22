require "spec_helper"

describe FeedManager do

  let(:user){ double('User')}
  let(:feed){ double("feed")}

  context "is asked for permisions to access feed" do

    it "should send message via given sender" do
      feed.stub(:owner)
      sender = double
      sender.should_receive(:send_message)
      FeedManager.ask_for_access(user, feed, sender)
    end
  end
end