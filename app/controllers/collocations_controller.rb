class CollocationsController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

  def create
    @collocation = Collocation.new(collocation_params)
    if @collocation.save
      message = { success: 'Added collocation successfully.', collocation: @collocation.collocation }
      render json: message
    else
      message = { error: @collocation.errors.full_messages }
      render json: message
    end
  end

  def destroy
    @collocation = Collocation.find(params[:id])
    if @collocation.destroy
      message = { success: 'Collocation has been destroyed.', collocation_id: @collocation.id }
      render json: message
    else
      message = { error: @collocation.errors.full_messages }
      render json: message
    end
  end

end
