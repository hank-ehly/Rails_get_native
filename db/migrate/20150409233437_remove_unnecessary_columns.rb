class RemoveUnnecessaryColumns < ActiveRecord::Migration
  def up
  	puts 'next removals for languages table'
    remove_column :languages, :language
    remove_column :languages, :videos_count
    remove_column :languages, :speakers_count
    remove_column :languages, :topics_count
    puts 'next removals for speakers table'
    remove_column :speakers, :native_language
    puts 'next removals for admins table'
    remove_column :admins, :username
    puts 'next removals for users table'
    remove_column :users, :auth_token
  end
  def down
  	puts 'next additions for languages table'
    add_column :languages, :language, :integer
    add_column :languages, :videos_count, :integer
    add_column :languages, :speakers_count, :integer
    add_column :languages, :topics_count, :integer
    puts 'next additions for speakers table'
    add_column :speakers, :native_language, :integer
    puts 'next additions for admins table'
    add_column :admins, :username, :string
    puts 'next additions for users table'
    add_column :users, :auth_token, :string
  end
end
