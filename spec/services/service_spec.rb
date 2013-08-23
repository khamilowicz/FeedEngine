require "spec_helper"

describe Service do
  it "creates specific services" do 
    service = Service.create :twitter, 'identifier'
    service.class.should be(TwitterFeed)
  end
end