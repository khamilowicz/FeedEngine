class AddPublicToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :public, :boolean, default: true
  end
end
