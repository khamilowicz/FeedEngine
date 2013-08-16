class AddDefaultValueOfPointsToPost < ActiveRecord::Migration
  def change
    change_column :posts, :points, :integer, default: 0
  end
end
