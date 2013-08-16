require "spec_helper"

describe FeedsController do

    let(:user) {FactoryGirl.create(:user)}
  before(:each) do
    @request.host = user.subdomain + '.example.com'
    user.feeds << FactoryGirl.create(:feed, :with_posts, post_number: 2)
  end
  context "#index" do
    it "paginates pages based on paginates_per value" do

    get :index, page: 1
    expect(assigns(:posts)).not_to be_empty
    get :index, page: 2
    expect(assigns(:posts)).to be_empty
    end
  end
end