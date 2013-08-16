require 'spec_helper'

describe "User pages" do

  describe "are accessed via subdomains" do
    def url_for_subdomain subdomain="www", path="/"
     "http://#{subdomain}.xip.io:#{Capybara.server_port}#{path}"
   end

   context "with valid user" do
    let(:user) {FactoryGirl.create(:user, feeds: [Feed.new])}

    it "'/' leads to show action" do

      visit url_for_subdomain( user.subdomain)
      page.should have_content(user.nick)
    end

    it "'/profile' leads to profile action" do
      visit url_for_subdomain( user.subdomain, '/profile')
      page.should have_content("#{user.nick}'s profile")
    end
  end


  context "with invalid user" do
    it "'/' leads to 404 page" do
      visit url_for_subdomain( 'sthing')
      page.status_code.should == 404
    end
  end
end
end