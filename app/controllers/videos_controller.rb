class VideosController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

  def index
    @language = Language.find(params[:language_id])
    @order = params[:order]
    @order_type = params[:order_type]
    case @order
    when "added"
      if @order_type == 'cba'
        @videos = @language.videos.oldest
      else
        @videos = @language.videos.newest
      end
    when "speaker"
      if @order_type == 'cba'
        @videos = @language.videos.speaker_cba
      else
        @videos = @language.videos.speaker_abc
      end
    when "topic"
      if @order_type == 'cba'
        @videos = @language.videos.topic_cba
      else
        @videos = @language.videos.topic_abc
      end
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
      @user = User.find(session[:user_id])
      @playlist = Playlist.find_by(user_id: @user.id)
      @user_playlist = Playlist.find_by(user_id: @user.id)
      @collocation = Collocation.new
      @user_playlist.playlist_videos.each do |playlist_video|
        if playlist_video.video_id == @video.id
          @playlist_video = PlaylistVideo.where(video_id: @video.id).first
          @collocations = Collocation.all.where(video_id: @video.id).where(user_id: @user.id).order("collocations.created_at ASC")
        end
      end
      # show 'collocations form inside ul.scripts'
    end
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
