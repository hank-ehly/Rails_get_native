class UsersController < ApplicationController

  before_action :confirm_logged_in, :except => [:add, :create]
  before_action :current_user_admin
  before_action :initialize_params

  def add
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account successfully created!"
      session[:user_id] = @user.id
      session[:email] = @user.email
      redirect_to controller: 'users', action: 'profile'
    else
      render('add')
    end
  end

  def profile
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    @view = params[:view]
    @view.blank? ? @view = 'account_info' : nil
    @actives = {@view => "active"}
    # @active  = {"account_info" => "active"}
    @topics = Topic.order("topics.name ASC")
    @speakers = Speaker.order("speakers.first_name ASC")
    @languages = Language.order("languages.name ASC")
    @admins = Admin.order("admins.first_name ASC")
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
    user.destroy
    flash[:success] = "#{user.email}'s account has been successfully deleted."
    session[:user_id] = nil
    session[:email] = nil
    redirect_to controller: 'access', action: 'login'
  end



end
