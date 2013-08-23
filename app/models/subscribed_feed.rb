class SubscribedFeed < ActiveRecord::Base
  belongs_to :subscribent, polymorphic: true
end
