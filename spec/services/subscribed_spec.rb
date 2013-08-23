require "spec_helper"

describe Subscribed do

  before(:each) do
    @feed = FactoryGirl.create(:feed)
  end

  it "should have subscribed feeds" do
    @feed.subscribed.should be_empty
  end

  context "with services" do
    before(:each){ @feed.subscribe :twitter, 'Name'}

    it "can subscribe to services" do
      @feed.subscribed_feeds.should_not be_empty
    end
  end
end