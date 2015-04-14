class PlaylistsController < ApplicationController

	def update
		@playlist = Playlist.find(params[:id])
		@video = Video.find(params[:video_id])
		if @playlist.videos << @video
			flash[:success] = "You added a video to your playlist."
			redirect_to controller: 'users', action: 'profile', view: 'playlist'
		else
			flash[:danger] = "Failed to add a video."
			redirect_to controller: 'videos', action: 'show', id: @video.id
		end
	end

end
