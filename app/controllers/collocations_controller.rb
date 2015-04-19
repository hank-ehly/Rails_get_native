class CollocationsController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

  def create
    @collocation = Collocation.new(collocation_params)
    if @collocation.save
      respond_to do |format|
        format.html
        format.js
      end
    else
      render :action => 'new'
    end
  end

end
