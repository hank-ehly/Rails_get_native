class AddPlaylistVideoIdToCollocations < ActiveRecord::Migration
  def change
  	add_column :collocations, :playlist_video_id, :integer
  	add_index :collocations, :playlist_video_id
  end
end
