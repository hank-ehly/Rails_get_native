class ChangeVideosLanguageIdToIntegerColumn < ActiveRecord::Migration
  def up
  	change_column :videos, :language_id, :integer
  end
  def down
  	change_column :videos, :language_id, :string
  end
end
