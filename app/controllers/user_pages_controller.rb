class UserPagesController < ApplicationController

  def index
    @view = params[:view]
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      @user = User.find(1)
    end
    if @view.blank?
      @view = 'account_info'
    end
  end
end
