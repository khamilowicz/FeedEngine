class TwitterFeed
  def self.from source
    TwitterFeed.new(source: source)
  end

  attr_reader :source

  def initialize params
    @source = params.fetch(:source)
  end

  def tweets
    Tweet.from_twitter Twitter.user_timeline(source)
  end
end

class Tweet

  def self.from_twitter tweets
    Array(tweets).map{|t| new(t)}
  end
  attr_reader :original_tweet

  def initialize tweet
    @original_tweet = tweet
  end

  def source
    original_tweet.attrs[:user][:screen_name]
  end

  def body
    original_tweet.attrs[:text]
  end
end