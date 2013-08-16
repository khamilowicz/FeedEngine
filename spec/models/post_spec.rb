require 'spec_helper'

describe Post do
  it{ should have_many :feeds}
  it{ should belong_to :user}
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
end

