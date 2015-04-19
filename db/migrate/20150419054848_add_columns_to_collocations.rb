class AddColumnsToCollocations < ActiveRecord::Migration
  def change
  	add_column :collocations, :collocation, :string
  	add_column :collocations, :context, :text
  end
end
