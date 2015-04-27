class Speaker < ActiveRecord::Base

	has_many :videos
	has_and_belongs_to_many :topics
	belongs_to :language

end
