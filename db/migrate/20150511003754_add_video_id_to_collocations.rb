class AddVideoIdToCollocations < ActiveRecord::Migration
  def change
  	add_column :collocations, :video_id, :integer
  end
end
