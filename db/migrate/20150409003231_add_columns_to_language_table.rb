class AddColumnsToLanguageTable < ActiveRecord::Migration
  def change
  	add_column :languages, :language, :integer
  	add_column :languages, :speakers_count, :integer
  	add_column :languages, :videos_count, :integer
  	add_column :languages, :topics_count, :integer
  end
end
