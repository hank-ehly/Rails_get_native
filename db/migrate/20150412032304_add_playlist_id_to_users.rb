class AddPlaylistIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :playlist_id, :integer
  	add_column :admins, :playlist_id, :integer
  end
end
