class VideosController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

  def index
    @language = Language.find(params[:language_id])
    @order = params[:order]
    case @order
    when "added"
      @videos = @language.videos.newest
    when "speaker"
      @videos = @language.videos.speaker_abc
    when "topic"
      @videos = @language.videos.topic_abc
    else
      @videos = @language.videos.topic_abc
    end
  end


  def show

    @video = Video.find(params[:id])
    url_queries = Rack::Utils.parse_query URI(@video.original_url).query
    @video_url = url_queries["v"]
    @language = Language.find(params[:language_id])

    if session[:user_id]
      @playlist = Playlist.find(User.find(session[:user_id]).playlists.first)
      @user = User.find(session[:user_id])
      @user_playlist = Playlist.find_by(user_id: @user.id)
      @collocation = Collocation.new
      # if user's playlist contains playlist video where video_id == @video.id
      @user_playlist.playlist_videos.each do |playlist_video|
        if playlist_video.video_id == @video.id
          @playlist_video = PlaylistVideo.where(video_id: @video.id).first
          @pvid = @playlist_video.id
          @collocations = @playlist_video.collocations.order("collocations.created_at DESC")
        end
      end
      # show 'collocations form inside ul.scripts'
    end
  end

  def new_collocation
    @collocation = Collocation.new
  end

  def create_collocation
    @collocations = Collocation.order("collocations.created_at DESC")
    @collocation = Collocation.new(collocation_params)
    video_id = params[:id]
    @playlist_video = PlaylistVideo.where(video_id: video_id).first
    @collocation.playlist_video_id = @playlist_video.id
    @collocation.save
    redirect_to :back
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
