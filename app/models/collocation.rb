# == Schema Information
#
# Table name: collocations
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  playlist_video_id :integer
#  collocation       :string(255)
#  context           :text(65535)
#  video_id          :integer
#  user_id           :integer
#
# Indexes
#
#  index_collocations_on_playlist_video_id  (playlist_video_id)
#

class Collocation < ActiveRecord::Base

  belongs_to :playlist_video

  validates :collocation, presence: true

end
