class CreateSubscribedFeeds < ActiveRecord::Migration
  def change
    create_table :subscribed_feeds do |t|
      t.string :service
      t.string :identifier

      t.timestamps
    end
  end
end
