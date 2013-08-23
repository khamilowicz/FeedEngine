class AddSubscribentIdToSubscribedFeeds < ActiveRecord::Migration
  def change
    add_reference :subscribed_feeds, :subscribent, index: true, polymorphic: true
  end
end
