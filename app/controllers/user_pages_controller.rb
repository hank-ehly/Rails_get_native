class UserPagesController < ApplicationController

  def index
  	@view = params[:view]
  	@user = User.find(1)
  	if @view.blank?
  		@view = 'account_info'
  	end
  end
end
