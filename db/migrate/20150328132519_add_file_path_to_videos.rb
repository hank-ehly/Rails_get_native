class AddFilePathToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :path, :string
  end
end
