class AddSpeakerFullNameAndTopicNameToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :speaker_full_name, :string
  	add_column :videos, :topic_name, :string
  end
end
