require 'spec_helper'

describe Feed do
  it{ should have_many(:posts)}
  it{ should belong_to(:user)}
  it{ should be_public}
  it{ should have_many(:allowed_users)}

  it "returns posts in chronological, descending order" do
    feed = FactoryGirl.create :feed
    post_earlier = FactoryGirl.create :post, created_at: 1.day.ago
    post_later = FactoryGirl.create :post, created_at: 1.minute.ago
    feed.posts << post_later
    feed.posts << post_earlier
    feed.posts << post_later
    feed.posts.should eq([post_later, post_later, post_earlier])
  end
end
