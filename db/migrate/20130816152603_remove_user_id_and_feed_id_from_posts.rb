class RemoveUserIdAndFeedIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :user_id, :string
    remove_column :posts, :feed_id, :string
  end
end
