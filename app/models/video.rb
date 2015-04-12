class Video < ActiveRecord::Base

	belongs_to :speaker
	belongs_to :topic

	scope :alphabetically_by_title, lambda { order("videos.title ASC") }

end