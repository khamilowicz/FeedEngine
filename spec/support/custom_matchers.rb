require "spec_helper"

RSpec::Matchers.define :have_posts do |posts|
  match_for_should do |page_content|
    page_content.should have_selector('.posts')
    within('.posts'){
      Array(posts).each do |post|
        page_content.should have_content post.title
        page_content.should have_content post.description
      end
    }
  end

  match_for_should_not do |page_content|
    Array(posts).each do |post|
      page_content.should_not have_content post.title
      page_content.should_not have_content post.description
    end
  end

end