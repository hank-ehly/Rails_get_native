class Speaker < ActiveRecord::Base

	has_many :videos
	belongs_to :language

end
