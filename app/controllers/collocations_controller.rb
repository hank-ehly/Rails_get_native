class CollocationsController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

  def create
    @collocation = Collocation.new(collocation_params)
    video = Video.find(@collocation.video_id)
    # get coll start position within j_script
    start_pos = video.japanese_script.index(@collocation.collocation)
    # get coll end position within j_scrtipt
    # end_pos = start_pos + collocation.length
    end_pos = start_pos + @collocation.collocation.size
    # if start_pos < 10, set start_pos = 10, that way it won't take from the end of the script
    if start_pos < 15
      start_pos = 15
      # elif end_pos > start_pos (ie it starts at beginning), set end_pos = j_script.length so that it doesn't take from beginning
    elsif end_pos < start_pos
      end_pos = video.japanese_script.size
    end
    # set collocation.context equal to video.j_script[(start_pos - 10 or so)..(end_pos + 10 or so)]
    @collocation.context = video.japanese_script[(start_pos - 15)..(end_pos + 15)]
    # highlight collocation inside context well
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
        # format.js {}
      else
        message = { error: @collocation.errors.full_messages }
        format.json { render json: message }
        # format.js {}
      end
    end
  end

end
