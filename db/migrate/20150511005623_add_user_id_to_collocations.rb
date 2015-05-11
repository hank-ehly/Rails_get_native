class AddUserIdToCollocations < ActiveRecord::Migration
  def change
  	add_column :collocations, :user_id, :integer
  end
end
