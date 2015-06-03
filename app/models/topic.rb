# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_name  (name) UNIQUE
#

class Topic < ActiveRecord::Base

	has_many :videos
	has_and_belongs_to_many :speakers
	has_and_belongs_to_many :languages

	validates :name,
		presence: true,
		uniqueness: true

	def self.nameFromPlaylistVideo(playlistVideo)
		video = Video.find(playlistVideo.video_id)
  	topic = Topic.find(video.topic_id)
  	return topic.name
	end

end
