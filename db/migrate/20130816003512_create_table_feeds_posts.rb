class CreateTableFeedsPosts < ActiveRecord::Migration
  def change
    create_table :feeds_posts do |t|
      t.integer :feed_id
      t.integer :post_id
    end
  end
end
