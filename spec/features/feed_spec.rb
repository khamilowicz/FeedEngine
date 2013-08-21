require "spec_helper"

describe "on feed page" do
    let(:feed) {FactoryGirl.create(:feed, subdomain: 'feed1') }

  before(:each) do
    posts = FactoryGirl.create_list(:post, 2, points: 2)
    feed.posts << posts
  end
  it "is total number of points for all posts" do
    visit '/feed1'
    page.should have_content "Total points 4"
  end
end