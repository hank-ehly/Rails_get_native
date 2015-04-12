class AddTopicsLanguageId < ActiveRecord::Migration
  def change
  	add_column :topics, :language_id, :integer
  end
end
