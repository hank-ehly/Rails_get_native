class RenameLanguageToNativeLanguageInSpeakersTable < ActiveRecord::Migration
  def up
  	rename_column :speakers, :language, :native_language
  end

  def down
  	rename_column :speakers, :native_language, :language
  end
end
