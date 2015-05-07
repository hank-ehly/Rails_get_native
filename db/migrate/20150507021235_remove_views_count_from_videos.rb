class RemoveViewsCountFromVideos < ActiveRecord::Migration
  def up
  	remove_column :videos, :views_count, :integer
  end
  def down
  	add_column :videos, :views_count, :integer
  end
end
