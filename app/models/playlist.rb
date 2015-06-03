# == Schema Information
#
# Table name: playlists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_playlists_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_d67ef1eb45  (user_id => users.id)
#

class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :playlist_videos
  has_many :videos, :through => :playlist_videos
  has_many :collocations, :through => :playlist_videos
end
