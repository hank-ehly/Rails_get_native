class TopicsController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin

  def add
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      # success
      flash[:success] = "You successfully created the topic: '#{topic.name}'"
      render('add')
    else
      # failure
      render('add')
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      # success
      flash[:success] = "You successfully updated the topic \'#{@topic.name}\'"
      redirect_to(controller: 'users', action: 'profile', view: 'topics')
    else
      # failure
      flash[:danger] = 'Unable to update topic.'
      render('edit')
    end
  end

  def delete
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    flash[:success] = "You have successfully deleted the topic '#{@topic.name}'"
    redirect_to(controller: 'users', action: 'profile', view: 'topics')
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end

end
