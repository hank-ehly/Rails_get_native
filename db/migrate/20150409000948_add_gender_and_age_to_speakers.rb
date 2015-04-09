class AddGenderAndAgeToSpeakers < ActiveRecord::Migration
  def change
  	# for the sake of simplicity, gender is a boolean
  	# can change later if need be
  	add_column :speakers, :gender, :boolean
  	# age is an integer with multiple age ranges served as radio button values
  	add_column :speakers, :age, :integer
  end
end
