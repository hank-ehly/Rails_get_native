class SpeakersController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params
  before_action :sent_speaker, except: [:index, :new, :create]



  def index
    @language = Language.find(params[:language_id])
  end

  def show
    @language = Language.find(params[:language_id])
    @speaker = Speaker.find(params[:id])
    @videos = Video.where(speaker_id: @speaker.id)
  end

  def new
    @speaker = Speaker.new
  end

  def create
    @speaker = Speaker.new(speaker_params)
    if @speaker.save
      flash[:success] = "Speaker successfully created."
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit
    # @speaker = Speaker.find(params[:id])
  end

  def update
    # @speaker = Speaker.find(params[:id])
    if @speaker.update_attributes(speaker_params)
      flash[:success] = "#{@speaker.first_name} #{@speaker.last_name}'s information was successfully updated."
      redirect_to(action: 'show', id: @speaker.id)
    else
      render('edit')
    end
  end

  def delete
    # @speaker = Speaker.find(params[:id])
  end

  def destroy
    # @speaker = Speaker.find(params[:id])
    if @speaker.destroy
      flash[:success] = "#{@speaker.first_name} #{@speaker.last_name} was successfully destroyed."
      redirect_to(action: 'index')
    else
      render('delete')
    end
  end

  private

    def sent_speaker
      @speaker = Speaker.find(params[:id])
    end

end
