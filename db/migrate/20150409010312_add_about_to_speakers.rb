class AddAboutToSpeakers < ActiveRecord::Migration
  def change
  	add_column :speakers, :about, :text
  end
end
