class SpeakersController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params



  def index
    @abc = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    @speakers = Speaker.order("speakers.first_name ASC")
  end

  def show
    @speaker = Speaker.find(params[:id])
  end

  def add
  end

  def create
    @speaker = Speaker.new(speaker_params)
    if @speaker.save
      flash[:success] = "Speaker successfully created."
      render('add')
    else
      render('add')
    end
  end

  def edit
    @speaker = Speaker.find(params[:id])
  end

  def update
    @speaker = Speaker.find(params[:id])
    if @speaker.update_attributes(speaker_params)
      flash[:success] = "#{@speaker.first_name} #{@speaker.last_name}'s information was successfully updated."
      redirect_to(action: 'show', id: @speaker.id)
    else
      render('edit')
    end
  end

  def delete
    @speaker = Speaker.find(params[:id])
  end

  def destroy
    @speaker = Speaker.find(params[:id])
    if @speaker.destroy
      flash[:success] = "#{@speaker.first_name} #{@speaker.last_name} was successfully destroyed."
      redirect_to(action: 'index')
    else
      render('delete')
    end
  end

end
