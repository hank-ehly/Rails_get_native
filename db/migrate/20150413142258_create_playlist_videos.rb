class CreatePlaylistVideos < ActiveRecord::Migration
  def change
    create_table :playlist_videos do |t|
      t.references :playlist, index: true
      t.references :video, index: true

      t.timestamps null: false
    end
    add_foreign_key :playlist_videos, :playlists
    add_foreign_key :playlist_videos, :videos
  end
end
