class Language < ActiveRecord::Base

	has_many :videos
	has_many :speakers
	has_and_belongs_to_many :topics

end
