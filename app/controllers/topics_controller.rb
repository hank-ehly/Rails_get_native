class TopicsController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

  def index
    @topics = Topic.order("topics.name ASC")
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      # success
      flash[:success] = "You successfully created the topic: '#{@topic.name}'"
      redirect_to action: 'index'
    else
      # failure
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    if params[:language_id]
      @language = Language.find(params[:language_id])
      @videos = Video.where(topic_id: params[:id], language_id: @language.id)
    else
      @videos = Video.where(topic_id: params[:id])
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      # success
      flash[:success] = "You successfully updated the topic \'#{@topic.name}\'"
      redirect_to topic_path(@topic.id)
    else
      # failure
      flash[:danger] = 'Unable to update topic.'
      render :edit
    end
  end

  def delete
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    flash[:success] = "You have successfully deleted the topic '#{@topic.name}'"
    redirect_to topics_path
  end

  private



end
