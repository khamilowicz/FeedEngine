require 'spec_helper'

describe Post do
  it{ should have_many :feeds}
  it{ should respond_to :user}
  it{ should respond_to :title}
  it{ should respond_to :description}

  describe "#add_points" do
    it "increments its points number" do
      post = Post.new
      expect{post.add_points}
      .to change{post.points}
      .from(0).to(1)
    end
  end

  describe ".description" do
    it "is at most 512 character long" do
      text = 'a'*512
      Post.new(description: text).should be_valid 
      Post.new(description: text + 'a').should_not be_valid
    end
  end
end

describe PhotoPost do
  it "has photo" do
    post = PhotoPost.new photo: 'http://www.something.com/whatever.jpg'
    post.photo.should eq('http://www.something.com/whatever.jpg')
  end

  it "has message at most 256 characters long" do
    text = 'a'*256
    post = PhotoPost.new description: text
    post.should be_valid
    post.description = text+'a'
    post.should_not be_valid
  end
end

