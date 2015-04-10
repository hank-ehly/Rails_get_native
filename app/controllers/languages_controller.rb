class LanguagesController < ApplicationController

	before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

  def index
  	@languages = Language.order("languages.name ASC")
  end

  def show
  	@language = Language.find(params[:id])
  end
  
end
