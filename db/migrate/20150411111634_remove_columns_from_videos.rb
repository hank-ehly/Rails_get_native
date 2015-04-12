class RemoveColumnsFromVideos < ActiveRecord::Migration
  def up
  	remove_column :videos, :video_filename
  	remove_column :videos, :speaker_name
  	remove_column :videos, :thumbnail_filename
  	remove_column :videos, :video
  end
  def down
  	add_column :videos, :video_filename, :string
  	add_column :videos, :speaker_name, :string
  	add_column :videos, :thumbnail_filename, :string
  	add_column :videos, :video, :string
  end
end
