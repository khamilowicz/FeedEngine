require "spec_helper"

describe GitHubFeed do
  let(:source){ "defunkt" }
  context "retrieves events from github" do

    before(:each) do
      VCR.use_cassette('github-me') do
        @events = GitHubFeed.from(source).events
      end
    end

    it "- create" do
      create_events = @events.find(:create)
      create_events.all?{|ce| ce.type == 'CreateEvent'}.should be_true
    end 
    it "- push" do
      create_events = @events.find(:push)
      create_events.all?{|ce| ce.type == 'PushEvent'}.should be_true
    end 
     it "- fork" do
      create_events = @events.find(:fork)
      create_events.all?{|ce| ce.type == 'ForkEvent'}.should be_true
    end
  end
end