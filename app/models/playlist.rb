class Playlist < ActiveRecord::Base

	belongs_to :user
	belongs_to :admin
	has_many :videos

end
