class RenamePathColumn < ActiveRecord::Migration
  def up
  	rename_column("videos", "path", "video_filename")
  end
  def down
  	rename_column("videos", "video_filename", "path")
  end
end
