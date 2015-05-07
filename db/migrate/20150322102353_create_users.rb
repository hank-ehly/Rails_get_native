class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
    	t.string "first_name", null: false
    	t.string "last_name", null: false 
    	t.string "username", null: false, unique: true
    	t.string "email", null: false, default: "", unique: true
    	t.string "password_digest"
      t.timestamps null: false
    end
    add_index("users", "username")
  end
  def down
    drop_table :users
  end
end
