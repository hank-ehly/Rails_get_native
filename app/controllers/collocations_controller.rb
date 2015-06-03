class CollocationsController < ApplicationController
  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

  def create
    @collocation = Collocation.new(collocation_params)
    video = Video.find(@collocation.video_id)
    start_pos = video.japanese_script.index(@collocation.collocation)
    end_pos = start_pos + @collocation.collocation.size
    if start_pos < 15
      start_pos = 15
    elsif end_pos < start_pos
      end_pos = video.japanese_script.size
    end
    @collocation.context = video.japanese_script[(start_pos - 15)..(end_pos + 15)]
    respond_to do |format|
      if @collocation.save
        message = { success: 'Added collocation successfully.', collocation: @collocation.collocation }
        format.json { render json: message }
        format.js {}
      else
        message = { error: @collocation.errors.full_messages }
        format.json { render json: message }
      end
    end
  end
  
  def destroy
    @collocation = Collocation.find(params[:id])
    respond_to do |format|
      if @collocation.destroy
        message = { success: 'Collocation has been destroyed.', collocation_id: @collocation.id }
        format.json { render json: message }
      else
        message = { error: @collocation.errors.full_messages }
        format.json { render json: message }
      end
    end
  end
end
