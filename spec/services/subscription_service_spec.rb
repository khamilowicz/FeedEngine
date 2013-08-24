require_relative "./../../app/services/subscription_service"


describe SubscriptionService do
  let(:user){FactoryGirl.create(:user)}
  let(:feed){FactoryGirl.create(:feed)}
  it "subscribes user to feed" do
    SubscriptionService.create(user: user, feed: feed)
    user.main_feed.subscribed_feeds.list.should include feed.subdomain
  end
end