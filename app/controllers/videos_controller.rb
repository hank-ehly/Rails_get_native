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
  end

  def add
    @topic = Topic.find(params[:topic_id]) if params[:topic_id]
  end

  def create
    @video = Video.new(video_params)
    
    url = Domainator.parse(@video.original_url)

    if url == "youtube.com"
      result = @video.original_url.match(/[\?\&]v\=([^&]+)/)
      if result.nil? || result[1].nil?
        @error = "The URL is not well formatted."
        render :add
        return
      end
      if @video.save
        flash[:success] = "Video was saved successfully."
        redirect_to(controller: 'videos', action: 'show', id: @video.id)
      else
        render :add
      end
    end

  end

  def study_index
    @videos = Video.alphabetically_by_title
  end

  

end
