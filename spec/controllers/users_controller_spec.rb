require 'spec_helper'

describe UsersController do


    context "with valid user" do
     let(:user) {FactoryGirl.create(:user, feeds: [Feed.new])}

     it "'/profile' leads to profile action" do
      get :profile, id: user.id
      assigns(:user).should eq(user)
    end
  end


  context "with invalid user" do
    it "'/' leads to 404 page" do
      get :profile, id: 'lala'
      expect(response.status).to eq(404)
    end
  end
end
