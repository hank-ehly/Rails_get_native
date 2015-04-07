class AddIndexToTopicId < ActiveRecord::Migration
  def change
  	add_index :videos, :topic_id
  end
end
