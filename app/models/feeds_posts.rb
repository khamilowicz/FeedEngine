class FeedsPosts < ActiveRecord::Base
  belongs_to :feed
  belongs_to :post
end