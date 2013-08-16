class CreateAllowedUsersFeeds < ActiveRecord::Migration
  def change
    create_table :allowed_users_feeds do |t|
      t.integer :user_id
      t.integer :feed_id

      t.timestamps
    end
  end
end
