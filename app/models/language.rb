class Language < ActiveRecord::Base

	has_many :videos
	has_many :speakers
	has_many :topics

end
