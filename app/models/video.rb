class Video < ActiveRecord::Base

	belongs_to :speaker
	belongs_to :topic
	belongs_to :language
	has_many :playlist_videos
	has_many :playlists, :through => :playlist_videos

	scope :speaker_abc, -> { order("videos.speaker_full_name ASC") }
	scope :speaker_cba, -> { order("videos.speaker_full_name DESC") }

	scope :topic_abc, -> { order("videos.topic_name ASC") }
	scope :topic_cba, -> { order("videos.topic_name DESC") }

	scope :newest, -> { order("videos.created_at DESC") }
	scope :oldest, -> { order("videos.created_at ASC") }

end