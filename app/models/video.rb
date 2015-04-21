class Video < ActiveRecord::Base

	belongs_to :speaker
	belongs_to :topic
	belongs_to :language
	has_many :playlist_videos
	has_many :playlists, :through => :playlist_videos

	scope :alphabetically_by_title, lambda { order("videos.title ASC") }

end