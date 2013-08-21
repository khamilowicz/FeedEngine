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

  it "has total points for all posts" do
    feed = FactoryGirl.create(:feed)
    posts = FactoryGirl.create_list(:post, 2, points: 2)
    feed.posts << posts
    feed.total_points.should eq(4)
  end

  context "can be locked" do

    before(:each) do
      feed.lock 
    end

    let(:feed){ Feed.new user: owner}
    subject{feed}
    let(:user){ FactoryGirl.create(:user)}
    let(:owner){ FactoryGirl.create(:user)}

    it{should_not be_public}

    it "allows owner to see itself" do
      feed.allow?(owner).should be_true 
    end

    it "doesn't allow users to see it" do
      feed.allow?(user).should be_false
    end

    it "can allow users to see itself" do
      feed.allow(user)
      feed.allow?(user).should be_true
    end
  end
end
