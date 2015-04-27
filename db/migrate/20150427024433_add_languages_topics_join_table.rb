class AddLanguagesTopicsJoinTable < ActiveRecord::Migration
	def change
    create_table :languages_topics, id: false do |t|
      t.integer :language_id
      t.integer :topic_id
    end
  end
end