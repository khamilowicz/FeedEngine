require "spec_helper"

RSpec::Matchers.define :have_posts do |posts|
  match do |page_content|
    Array(posts) do |post|
      page_content.should have_content post.title
      page_content.should have_content post.desription
      page_content.should have_content post.created_at
    end
  end
end