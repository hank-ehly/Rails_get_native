class ChangeNativeLanguageToIntegerDataType < ActiveRecord::Migration
  def up
  	change_column :speakers, :native_language, :integer
  end
  def down
  	change_column :speakers, :native_language, :string
  end
end
