class AddUniqueIndexToTopicName < ActiveRecord::Migration
  def change
  	add_index :topics, :name, unique: true
  end
end
