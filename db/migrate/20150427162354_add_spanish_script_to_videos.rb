class AddSpanishScriptToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :spanish_script, :text
  end
end
