class Video < ActiveRecord::Base

	scope :alphabetically_by_title, lambda { order("videos.title ASC") }


end
