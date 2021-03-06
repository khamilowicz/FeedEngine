require "spec_helper"

def user_feed user
  url_for_subdomain user.main_feed.subdomain
end

describe "Guest" do

  it "cannot go to nonexistent feed" do
    visit '/somefeed'
    current_path.should eq('/')
  end

  it "can log in" do
    user = FactoryGirl.create(:user, password: 12345678, password_confirmation: 12345678)
    visit '/'
    click_link 'Log in'
    fill_in :user_email, with: user.email
    fill_in :user_password, with: 12345678 
    click_button 'Sign in'
    page.should have_content(user.nick)
  end

  context "in public feeds" do
    let(:user) {FactoryGirl.create(:user)}

    before(:each) do
      user.main_feed.posts.create 
      visit user_feed user
    end
    
    it "can see posts" do
      page.should have_content(user.nick)
      page.should have_posts(user.main_feed.posts)
    end

    it "can not add point to posts" do
      page.should have_content("Points! 0")
      click_link 'Points!'
      page.should_not have_content("Points! 1")
      page.should have_content("Sign in")
    end
  end
end