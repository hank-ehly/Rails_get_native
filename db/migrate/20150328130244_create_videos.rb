class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.integer :duration
      t.string :speaker_name
      t.text :description
      t.integer :views_count
      t.integer :speaker_id
      t.string :language
      t.text :script

      t.timestamps null: false
    end
    add_index :videos, :speaker_id
  end
end
