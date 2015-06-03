# == Schema Information
#
# Table name: speakers
#
#  id          :integer          not null, primary key
#  first_name  :string(255)
#  last_name   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  gender      :boolean
#  age         :integer
#  about       :text(65535)
#  language_id :integer
#
# Indexes
#
#  index_speakers_on_language_id  (language_id)
#

class Speaker < ActiveRecord::Base

	has_many :videos
	has_and_belongs_to_many :topics
	belongs_to :language


  def self.fullNameFromPlaylistVideo(playlistVideo)
  	video 						= Video.find(playlistVideo.video_id)
  	speaker 					= Speaker.find(video.speaker_id)
  	speakerFullName 	= speaker.first_name + " " + speaker.last_name
  	return speakerFullName
  end

end
