class RemoveEmailFromSpeakers < ActiveRecord::Migration
  def change
  	remove_column :speakers, :email, :string
  end
end
