require "spec_helper"

describe "Authenticated user" do

  def sign_in user
    visit '/'
    click_link 'Log in'
    page.should have_content('Email'), "#{page.find('body').native}"
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button 'Sign in'
  end

  let(:user){FactoryGirl.create(:user)} 
  let(:other_user){FactoryGirl.create(:user)}

  before(:each) do
    sign_in user
  end

  it "redirects to profile after sign in" do
    page.should have_content("#{user.nick}'s profile")
  end

  context "on other feeds" do
    let(:feed){ other_user.main_feed}

    before(:each) do
      other_user.add_to_main_feed FactoryGirl.create(:post)
      visit "/#{other_user.subdomain}"
    end

    it "can see public feeds" do
      page.should have_posts(feed.posts), "#{page.find('body').native}"
      visit "/#{user.subdomain}"
      page.should_not have_posts(feed.posts)
    end

    it "can republish posts of other feeds" do
      click_link 'Refeed'
      visit url_for_subdomain(user.subdomain)

      page.should have_posts(feed.posts)
    end
  end
end