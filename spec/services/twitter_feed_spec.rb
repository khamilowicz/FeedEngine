require "spec_helper"

describe TwitterFeed do
  let(:source){ "Khamilowicz" }
  before(:each) do
    VCR.use_cassette('tweets-me') do
      @tweets = TwitterFeed.from(source).tweets
    end
  end

  it 'retrieves tweets' do 
    tweet = @tweets.first
    tweet.source.should eq(source)
    tweet.body.should eq("test tweet")
  end
end