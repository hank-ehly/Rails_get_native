class CollocationsController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params
  before_action :all_collocations, only: [:index, :create]
  respond_to :js, :html

  def new
    @collocation = Collocation.new
  end

  def create
    @collocation = Collocation.new(collocation_params)
    @collocation.playlist_video_id = params[:id]
    @collocation.save
  end

  private

  def all_collocations
    @collocations = Collocation.order("collocations.created_at DESC")
  end

end
