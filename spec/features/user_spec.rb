require "spec_helper"

describe "Authenticated user" do

  def user_feed user
    url_for_subdomain user.main_feed.subdomain
  end

  def sign_in user
    visit '/'
    click_link 'Log in'
    page.should have_content('Email')
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

  it "can see notification about pending access requests with count" do
    page.should have_no_content("Pending access requests:")
    FeedManager.ask_for_access other_user, user.main_feed
    visit current_path
    page.should have_content("Pending access requests: 1") 
  end

  context "on his profile" do
    before(:each) do
      visit user_feed user
    end

    context "on linked services tab" do
      before(:each) do
        click_link 'Linked Services'
      end

      it "can link to twitter account" do
        within('.add'){fill_in 'twitter_id', with: 'Khamilowicz'}
        VCR.use_cassette(:tweets_me) do 
          click_button "Link to Twitter"
          visit user_feed user
        end
        page.should have_selector('.tweet')
        page.should have_content('test tweet')
        click_link 'Linked Services'
        within('.remove'){fill_in 'twitter_id', with: 'Khamilowicz'}
        click_button "Unlink Twitter"
        visit user_feed user
        page.should_not have_selector('.tweet')
        page.should have_content
      end
    end

    context "on visibility tab" do
      before(:each) do
        click_link "Visibility"
      end

      it "can change profile's visibilty and see the current status" do 
        page.should have_content "Feed is public"
        page.should have_no_content "Feed is private"
        click_link "Make private"
        page.should have_no_content "Feed is public"
        page.should have_content "Feed is private"
      end

      it "can see pending requests for access, grant one and see list of approved users" do
        other_user = FactoryGirl.create(:user)
        visit current_path
        page.should have_no_content other_user.nick
        FeedManager.ask_for_access other_user, user.main_feed
        visit current_path
        within('.granted'){ page.should have_no_content other_user.nick}
        within('.pleads'){ page.should have_content other_user.nick}
        click_button "Approve"
        within('.granted'){ page.should have_content other_user.nick }
        within('.pleads'){ page.should have_no_content other_user.nick }
      end
    end
    it "posts a message" do
      within('.new_post'){
        fill_in 'post[description]', with: 'Text message'
        click_button 'Submit'
      }
      page.should have_content "Text message"
    end

    it "posts a photo with 256 char long message" do
      click_link 'Photo'
      within('form.new_photo_post'){
        fill_in 'photo_post[description]', with: 'some description'
        fill_in 'photo_post[photo]', with: 'http://www.whatever.com/something.jpg'
        click_button 'Submit'
      }
      page.should have_content('some description')
      page.should have_selector("img[src='http://www.whatever.com/something.jpg']")
    end

  end

  context "on other feeds" do
    let(:feed){ other_user.main_feed}

    before(:each) do
      other_user.add_to_main_feed FactoryGirl.create(:post)
      visit user_feed other_user
    end

    it "can see public feeds" do
      page.should have_posts(feed.posts), "#{page.find('body').native}"
      visit user_feed user
      page.should_not have_posts(feed.posts)
    end

    it "can republish posts of other feeds" do
      click_link 'Refeed'
      visit user_feed user
      page.should have_posts(feed.posts)
    end

    it "gives points to posts" do
      page.should have_no_content("Points! 1")
      click_link "Points!"
      page.should have_content("Points! 1")
    end

    context "in private feeds" do

      let(:user_private) {FactoryGirl.create(:user)}
      let(:feed) {user_private.main_feed}

      before(:each) do
        user_private.add_to_main_feed FactoryGirl.create(:post)
        user_private.main_feed.lock
        visit user_feed user_private
      end

      it "can see content if he has access" do
        feed.allow(user)
        visit user_feed user_private
        page.should have_posts(feed.posts)
      end

      it "can not see content if he has no access" do
        page.should have_content("This feed is private.")
        page.should_not have_posts(feed.posts)
      end

      it "can ask for access" do
        FeedManager.should_receive(:ask_for_access).with(user, feed){ true }
        click_link "Ask for access"
      end
    end
  end
end