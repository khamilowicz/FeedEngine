require 'spec_helper'

describe Post do
  it{ should have_many :feeds}
  it{ should belong_to :user}
  it{ should respond_to :title}
  it{ should respond_to :description}
end
