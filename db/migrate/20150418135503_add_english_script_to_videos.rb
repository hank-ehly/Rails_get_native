class AddEnglishScriptToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :english_script, :text
  end
end
