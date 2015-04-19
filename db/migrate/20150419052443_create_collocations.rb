class CreateCollocations < ActiveRecord::Migration
  def change
    create_table :collocations do |t|

      t.timestamps null: false
    end
  end
end
