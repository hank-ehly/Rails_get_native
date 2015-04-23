class CollocationsController < ApplicationController

  before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params
  before_action :all_collocations, only: [:index, :create]
  respond_to :html, :js

  def new
    @collocation = Collocation.new
  end

  def create
    @collocation  = Collocation.create(collocation_params)
  end

  private

    def all_collocations
      @collocations = Collocation.all
    end

end
