class PlaylistVideosController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

  def destroy
    playlist_video = PlaylistVideo.find(params[:id])
    if playlist_video.destroy
      flash[:success] = "Video was successfully deleted from your playlist."
      redirect_to :back
    else
      redirect_to :back
    end
  end

end
