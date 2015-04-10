class AddLanguageIdToSpeakers < ActiveRecord::Migration
  def change
  	add_column :speakers, :language_id, :integer
  	add_index :speakers, :language_id
  end
end
