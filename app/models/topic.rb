class Topic < ActiveRecord::Base

	has_many :videos
	has_and_belongs_to_many :speakers
	has_and_belongs_to_many :languages

	validates :name,
		presence: true,
		uniqueness: true
	
end
