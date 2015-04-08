class VideosController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin

  def index
    @abc = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    @topics = Topic.order("topics.name ASC")
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
