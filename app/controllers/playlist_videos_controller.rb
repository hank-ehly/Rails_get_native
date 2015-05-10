class PlaylistVideosController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

  def destroy
    playlist_video = PlaylistVideo.find(params[:id])
    video_topic = Topic.find(Video.find(playlist_video.video_id).topic_id).name
    video_speaker = full_name_of(Speaker.find(Video.find(playlist_video.video_id).speaker_id))
    if playlist_video.destroy
      flash[:success] = "#{video_speaker}'s video '#{video_topic}' was successfully deleted from your playlist."
      redirect_to :back
    else
      redirect_to :back
    end
  end

end
