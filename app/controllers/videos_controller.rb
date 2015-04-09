class VideosController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

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

  

end
