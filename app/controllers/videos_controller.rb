class VideosController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

  def index
  end

  def show
    @video = Video.find(params[:id])
    url_queries = Rack::Utils.parse_query URI(@video.original_url).query
    @video_url = url_queries["v"]
    @playlist = Playlist.find(User.find(session[:user_id]).playlists.first) if session[:user_id]
  end

  def new
    @topic = Topic.find(params[:topic_id]) if params[:topic_id]
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    
    url = Domainator.parse(@video.original_url)

    if url == "youtube.com"
      result = @video.original_url.match(/[\?\&]v\=([^&]+)/)
      if result.nil? || result[1].nil?
        @error = "The URL is not well formatted."
        render :new
        return
      end
      if @video.save
        flash[:success] = "Video was saved successfully."
        redirect_to video_path(@video.id)
      else
        render :new
      end
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(video_params)
      flash[:success] = "Video was successfully updated."
      redirect_to video_path(@video.id)
    else
      render :edit
    end
  end

end
