require "spec_helper"

def user_feed user
  url_for_subdomain user.subdomain
  
end

describe "Guest" do
  it "can see public feeds" do
    user = FactoryGirl.create(:user)
    user.feeds << FactoryGirl.create(:feed, :with_posts, post_number: 1)
    visit user_feed user
    page.should have_content(user.nick)
    page.should have_posts(user.main_feed.posts)
  end
end