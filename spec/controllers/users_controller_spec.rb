require 'spec_helper'

describe UsersController do

  describe "is accessed via subdomains" do
    # def url_for_subdomain subdomain="www", path="/"
    #   "http://#{subdomain}.127.0.0.1.xip.io#{path}"
    # end

    context "with valid user" do
       let(:user) {FactoryGirl.create(:user)}

      it "'/' leads to show action" do
        @request.host = user.subdomain + '.local.me'
        get :show
        expect(assigns(:user)).to eq(user)
      end

      it "'/profile' leads to profile action" do
        @request.host = user.subdomain + '.local.me/profile'
              
      end
    end


      context "with invalid user" do
        it "'/' leads to 404 page" do
          @request.host = 'something' + '.local.me'
          get :show
          expect(response.status).to eq(404)
        end
    end
  end
end
