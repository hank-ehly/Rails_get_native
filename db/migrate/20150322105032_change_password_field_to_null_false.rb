class ChangePasswordFieldToNullFalse < ActiveRecord::Migration
  def up
  	change_column("users", "password", :string, null: false)
  end
  def down
  	change_column("users", "password", :string, null: true)
  end
end
