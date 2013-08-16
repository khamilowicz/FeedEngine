require 'spec_helper'

describe UsersController do

  describe "is accessed via subdomains" do

    context "with valid user" do
       let(:user) {FactoryGirl.create(:user, feeds: [Feed.new])}
       before(:each) do
        @request.host = user.subdomain + '.example.com'
       end

      it "'/profile' leads to profile action" do
        get :profile
        assigns(:user).should eq(user)
      end
    end


      context "with invalid user" do
        it "'/' leads to 404 page" do
          @request.host = 'something' + '.example.com'
          get :profile
          expect(response.status).to eq(404)
        end
    end
  end
end
