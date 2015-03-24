class UserPagesController < ApplicationController

  before_action :confirm_logged_in

  def index
    @view = params[:view]
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    if @view.blank?
      @view = 'account_info'
    end
  end
end
