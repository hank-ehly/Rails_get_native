class AddJapaneseScriptToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :japanese_script, :text
  end
end
