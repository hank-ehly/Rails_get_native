class AddThumbnailFilenameColumn < ActiveRecord::Migration
  def change
  	add_column :videos, :thumbnail_filename, :string
  end
end
