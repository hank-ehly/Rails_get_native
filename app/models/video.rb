class Video < ActiveRecord::Base

	belongs_to :speaker
	belongs_to :topic
	belongs_to :user

	scope :alphabetically_by_title, lambda { order("videos.title ASC") }

end