class VideosController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin

  def add
    @topic = Topic.find(params[:topic_id]) if params[:topic_id]
  end

  def create
    @video = Video.new(video_params)
    @video.save
  end

  def study_index
    @videos = Video.alphabetically_by_title
  end

  def video_params
    params.require(:video).permit(
    :title, 
    :duration, 
    :speaker_name, 
    :description, 
    :views_count, 
    :speaker_id, 
    :language, 
    :script, 
    :video_filename, 
    :thumbnail_filename, 
    :topic_id
    )
  end

end
