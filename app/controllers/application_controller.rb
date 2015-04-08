class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user_admin
    if session[:user_id]
      @current_user_admin = User.find(session[:user_id])
      @layout_style = 'User'
    elsif session[:admin_id]
      @current_user_admin = Admin.find(session[:admin_id])
      @layout_style = 'Admin'
    end
  end

  private

  def confirm_logged_in
    unless current_user_admin
      flash[:danger] = "Please login."
      redirect_to(:controller => 'access', :action => 'login')
      return false # halts the before_action
      # stops everything from going
    else
      return true
    end
  end

end
