# == Schema Information
#
# Table name: playlist_videos
#
#  id          :integer          not null, primary key
#  playlist_id :integer
#  video_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_playlist_videos_on_playlist_id  (playlist_id)
#  index_playlist_videos_on_video_id     (video_id)
#
# Foreign Keys
#
#  fk_rails_1895201911  (playlist_id => playlists.id)
#  fk_rails_f4976198c9  (video_id => videos.id)
#

class PlaylistVideo < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :video
  has_many :collocations
end
