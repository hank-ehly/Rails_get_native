class StudyPagesController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params
  before_action :userSettings, only: [:index]

  def index
    
    if params[:lang]

      @lang = Language.find_by(name: params[:lang])

      @userPlaylistVideos.each do |playlistVideo|

        video     = Video.find(playlistVideo.video_id);
        language  = Language.find(video.language_id);

        if @lang.name == language.name
          @languageSpecificPlaylistVideos << playlistVideo
        end

      end # @user.playlist_videos.each do |playlistVideo|

    end # if params[:lang]

  end # def index

  def shadowing
    @controls_bool = 0
    @autoplay_bool = 1
    session[:study_time] = params[:foo][:study_time]
    @playlist_video = PlaylistVideo.find(params[:playlist_video])
    @video = Video.find(@playlist_video.video_id)
    get_video_url
  end

  def speaking
    @smallButton = true
    @controls_bool = 1
    @autoplay_bool = 0
    @timerButton = true
    @playlist_video = PlaylistVideo.find(params[:id])
    @video = Video.find(@playlist_video.video_id)
    @collocation = Collocation.new
    @collocations = @playlist_video.collocations.order("collocations.created_at DESC")
    get_video_url
  end

  def listening
    @controls_bool = 0
    @autoplay_bool = 1
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

  private

  def userSettings

    @user                           =   User.find(session[:user_id]) if session[:user_id]
    @userPlaylistVideos             =   PlaylistVideo.findUserPlaylistVideos(@user)
    @languageSpecificPlaylistVideos =   Array.new
    @userPlaylistVideoLanguages     =   Array.new

    Language.all.each do |language|
      @userPlaylistVideos.each do |playlistVideo|
        @userPlaylistVideoLanguages << Language.find(Video.find(playlistVideo.video_id).language_id)
      end
    end
    @userPlaylistVideoLanguages = @userPlaylistVideoLanguages.uniq

  end

end
