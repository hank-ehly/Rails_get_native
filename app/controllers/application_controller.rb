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

  def initialize_params
    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :username, :email, :email_confirmation, :password, :password_confirmation)
    end
    def language_params
      params.require(:language).permit(:language, :name)
    end
    def speaker_params
      params.require(:speaker).permit(:first_name, :last_name, :language_id, :gender, :age)
    end
    def topic_params
      params.require(:topic).permit(:name)
    end
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :email, :email_confirmation)
    end
    def video_params
      params.require(:video).permit(:title, :duration, :speaker_name, :description, :views_count, :speaker_id, :language, :script, :video_filename, :thumbnail_filename, :topic_id, :video)
    end
  end

end
