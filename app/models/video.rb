# == Schema Information
#
# Table name: videos
#
#  id                :integer          not null, primary key
#  speaker_id        :integer
#  language_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  topic_id          :integer
#  original_url      :string(255)
#  japanese_script   :text(65535)
#  english_script    :text(65535)
#  spanish_script    :text(65535)
#  speaker_full_name :string(255)
#  topic_name        :string(255)
#
# Indexes
#
#  index_videos_on_speaker_id  (speaker_id)
#  index_videos_on_topic_id    (topic_id)
#

class Video < ActiveRecord::Base

	belongs_to :speaker
	belongs_to :topic
	belongs_to :language
	has_many :playlist_videos
	has_many :playlists, :through => :playlist_videos
	has_many :collocations

	scope :speaker_abc, -> { order("videos.speaker_full_name ASC") }
	scope :speaker_cba, -> { order("videos.speaker_full_name DESC") }

	scope :topic_abc, -> { order("videos.topic_name ASC") }
	scope :topic_cba, -> { order("videos.topic_name DESC") }

	scope :newest, -> { order("videos.created_at DESC") }
	scope :oldest, -> { order("videos.created_at ASC") }

	def self.thumbnail(videoObject, playlistVideo=false, returnUrl=false)
		if playlistVideo; video = Video.find(videoObject.video_id); else; video = videoObject; end
		url_queries = Rack::Utils.parse_query URI(video.original_url).query; url = url_queries["v"]
		if returnUrl
			return url
		else
			return "http://i1.ytimg.com/vi/" + url + "/default.jpg"
		end
	end

end
