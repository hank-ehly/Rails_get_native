class CreateSpeakersTopicsJoin < ActiveRecord::Migration
  def change
    create_table :speakers_topics, id: false do |t|
    	t.integer :speaker_id
    	t.integer :topic_id
    end
    add_index :speakers_topics, [:speaker_id, :topic_id]
  end
end
