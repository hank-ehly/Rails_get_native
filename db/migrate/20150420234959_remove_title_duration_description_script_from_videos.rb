class RemoveTitleDurationDescriptionScriptFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :title, :string
    remove_column :videos, :duration, :integer
    remove_column :videos, :description, :text
    remove_column :videos, :script, :text
  end
end
