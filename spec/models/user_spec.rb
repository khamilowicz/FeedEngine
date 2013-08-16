require 'spec_helper'

describe User do

  it "automatically creates its first feed" do
    FactoryGirl.create(:user).feeds.should_not be_empty
  end

  it "#add_to_main_feed adds posts to main feed" do
    user = FactoryGirl.create(:user)
    user.main_feed.posts.should be_empty
    user.add_to_main_feed Post.new
    user.main_feed.posts.should_not be_empty
  end
end
