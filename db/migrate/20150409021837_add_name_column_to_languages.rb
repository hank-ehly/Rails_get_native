class AddNameColumnToLanguages < ActiveRecord::Migration
  def change
  	add_column :languages, :name, :string
  end
end
