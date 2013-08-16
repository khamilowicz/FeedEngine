require "spec_helper"

RSpec::Matchers.define :have_posts do |posts|
  match do |page_content|
    page_content.should have_selector('.posts')
    within('.posts'){
      Array(posts).each do |post|
        page_content.should have_content post.title
        page_content.should have_content post.description
      end
    }
  end

end