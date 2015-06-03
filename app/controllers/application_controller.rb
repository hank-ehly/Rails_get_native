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
      flash[:danger] = "Please login to view this page."
      redirect_to(controller: 'access', action: 'login')
      return false # halts the before_action
      # stops everything from going
    else
      return true
    end
  end

  def initialize_params
    # @age_ranges = ["0~19","20~29","30~39","40~49","50~64","65+"]
    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :email, :email_confirmation, :password, :password_confirmation)
    end
    def collocation_params
      params.require(:collocation).permit(:collocation, :context, :playlist_video_id, :video_id, :user_id)
    end
    def language_params
      params.require(:language).permit(:name)
    end
    def speaker_params
      params.require(:speaker).permit(:first_name, :last_name, :language_id, :gender, :age)
    end
    def topic_params
      params.require(:topic).permit(:name)
    end
    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :email_confirmation)
    end
    def video_params
      params.require(:video).permit(:original_url, :speaker_id, :language_id, :topic_id, :japanese_script, :english_script, :spanish_script, :speaker_full_name, :topic_name)
    end
  end

end
