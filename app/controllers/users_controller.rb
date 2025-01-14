class UsersController < ApplicationController

  before_action :confirm_logged_in, :except => [:new, :create]
  before_action :current_user_admin
  before_action :initialize_params

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.playlists.create
      flash[:success] = "Account successfully created!"
      session[:user_id] = @user.id
      session[:email] = @user.email
      redirect_to controller: 'users', action: 'profile'
    else
      render :new
    end
  end

  def profile
    @user = User.find(session[:user_id]) if session[:user_id]
    @view = params[:view]
    @view.blank? ? @view = 'account_info' : nil
    @actives = {@view => "active"}
    # @active  = {"account_info" => "active"}
    @topics = Topic.order("topics.name ASC")
    @speakers = Speaker.order("speakers.first_name ASC")
    @languages = Language.order("languages.name ASC")
    @admins = Admin.order("admins.first_name ASC")
    @videos = Video.order("videos.created_at DESC")
    unless @layout_style == 'Admin'
      @user_playlist = @user.playlists.first
      @playlist_videos = @user_playlist.playlist_videos
      @collocations = Collocation.where(user_id: @user.id)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "#{@user.email}'s information has been successfully updated."
      redirect_to(:controller => 'users', :action => 'profile')
    else
      render :edit
    end
  end

  def delete
    @user = User.find(session[:user_id])
  end

  def destroy
    user = User.find(session[:user_id])
    user.playlists.take.playlist_videos.all.each do |playlist_video|
      if playlist_video.destroy
        if user.playlists.take.destroy
          user.destroy
        else
          render :delete
        end
      else
        render :delete
      end
    end
    flash[:success] = "#{user.email}'s account has been successfully deleted."
    session[:user_id] = nil
    session[:email] = nil
    redirect_to controller: 'access', action: 'login'
  end



end
