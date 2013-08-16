class AddPointsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :points, :integer
  end
end
