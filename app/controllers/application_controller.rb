class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user_or_admin
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    elsif session[:admin_id]
      @current_admin = Admin.find(session[:admin_id])
    end
  end

  private

  def confirm_logged_in
    unless current_user_or_admin
      flash[:notice] = "Please login."
      redirect_to(:controller => 'access', :action => 'login')
      return false # halts the before_action
      # stops everything from going
    else
      return true
    end
  end

end
