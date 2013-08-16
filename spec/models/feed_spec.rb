require 'spec_helper'

describe Feed do
  it{ should have_many(:posts)}
  it{ should belong_to(:user)}
  it{ should be_public}
  it{ should have_many(:allowed_users)}
end
