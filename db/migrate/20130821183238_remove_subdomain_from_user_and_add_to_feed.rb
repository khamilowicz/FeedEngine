class RemoveSubdomainFromUserAndAddToFeed < ActiveRecord::Migration
  def change
    remove_column :users, :subdomain, :string
    add_column :feeds, :subdomain, :string
  end
end
