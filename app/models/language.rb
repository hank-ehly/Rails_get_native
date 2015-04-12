class Language < ActiveRecord::Base

	has_many :speakers
	has_many :videos

end
