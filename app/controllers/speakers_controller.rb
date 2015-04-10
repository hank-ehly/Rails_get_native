class SpeakersController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params



  def index
    @abc = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    @speakers = Speaker.order("speakers.first_name ASC")
  end

  def show
    @speaker = Speaker.find(params[:speaker_id])
    age_of(@speaker)
    @native_language = Language.where(id: @speaker.language_id)
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

  private

  def age_of(speaker)
    case speaker.age
    when 0
      @speaker_age = "0~19"
    when 1
      @speaker_age = "20~29"
    when 2
      @speaker_age = "30~39"
    when 3
      @speaker_age = "40~49"
    when 4
      @speaker_age = "50~64"
    when 5
      @speaker_age = "65+"
    else
      nil
    end
  end

  # native language '0' => English, '1' => Japanese

end
