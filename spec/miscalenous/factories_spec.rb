require "spec_helper"

describe "user factory" do
  it "creates valid user" do
    user = FactoryGirl.create(:user)
    user.should be_valid
  end
end