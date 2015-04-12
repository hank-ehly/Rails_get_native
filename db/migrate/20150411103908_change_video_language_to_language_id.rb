class ChangeVideoLanguageToLanguageId < ActiveRecord::Migration
  def up
  	rename_column :videos, :language, :language_id
  end
  def down
  	rename_column :videos, :language_id, :language
  end
end
