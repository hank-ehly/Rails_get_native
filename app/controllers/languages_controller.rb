class LanguagesController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

  def index
    @languages = Language.order("languages.name ASC")
  end

  def new
    if params[:id]
      @language = Language.find(params[:id])
    end
  end

  def create
    @language = Language.new(language_params)
    if @language.save
      flash[:success] = "The language '#{@language.name}' has been successfully created."
      redirect_to(action: 'show', id: @language.id)
    else
      render :new
    end
  end

  def show
    @language = Language.find(params[:id])
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])
    if @language.update_attributes(language_params)
      flash[:success] = "The language '#{@language.name}' has been successfully updated."
      redirect_to(action: 'show', id: @language.id)
    else
      render('show')
    end
  end

  def delete
    @language = Language.find(params[:id])
  end

  def destroy
    @language = Language.find(params[:id])
    if @language.destroy
      flash[:success] = "The language '#{@language.name}' has been successfully destroyed."
      redirect_to(action: 'index')
    else
      render('delete')
    end
  end

  def topics
    @language = Language.find(params[:id])
    @topics = @language.topics.order("topics.name ASC")
  end

  def speakers
    @language = Language.find(params[:id])
    @speakers = @language.speakers.order("speakers.first_name ASC")
  end

  def videos
    @language = Language.find(params[:id])
    @videos = @language.videos.order("videos.created_at DESC")
  end

end
