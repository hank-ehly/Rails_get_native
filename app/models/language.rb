# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

class Language < ActiveRecord::Base

	has_many :videos
	has_many :speakers
	has_and_belongs_to_many :topics

end
