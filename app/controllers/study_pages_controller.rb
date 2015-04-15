class StudyPagesController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

  def index
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def shadowing
    @playlist_video = PlaylistVideo.find(params[:playlist_video])
    @video = Video.find(@playlist_video.video_id)
    get_video_url
  end

  def speaking
    @playlist_video = PlaylistVideo.find(params[:id])
    @video = Video.find(@playlist_video.video_id)
    get_video_url
  end

  def listening
    @playlist_video = PlaylistVideo.find(params[:id])
    @video = Video.find(@playlist_video.video_id)
    get_video_url
  end

  def writing
    @playlist_video = PlaylistVideo.find(params[:id])
    @video = Video.find(@playlist_video.video_id)
    get_video_url
  end

  def submit_writing
    @message = params[:message]
  end

  def submit_and_return_to_root
    flash[:success] = "Your message has been submitted for revision. Please allow 1~2 days for processing."
    redirect_to root_path
  end

  def get_video_url
    url_queries = Rack::Utils.parse_query URI(@video.original_url).query
    @video_url = url_queries["v"]
  end
end
