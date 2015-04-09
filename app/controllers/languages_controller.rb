class LanguagesController < ApplicationController

	before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params
  
end
