class VideosController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin

  def index
  end

  def create
    @video = Video.new(video_params)
    @video.save
  end

  def study_index
    @videos = Video.alphabetically_by_title
  end

  def shadowing

  end

  def speaking

  end

  def listening

  end

  def writing

  end

  def init_study_session
    
  end

  def video_params
    params.require(:video).permit(:title, :duration, :speaker_name, :description, :language, :script, :path)
  end

end
