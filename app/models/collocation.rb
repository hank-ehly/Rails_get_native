class Collocation < ActiveRecord::Base

  belongs_to :playlist_video

  validates :collocation, presence: true

end
