class AccessController < ApplicationController
  
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :sign_up, :logout, :create]

  def index
    # text and links
  end

  def sign_up
    # @user = User.find()

  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to(:controller => 'user_pages', :action => 'index')
    else
      render('sign_up')
    end
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(:controller => "user_pages", :action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => 'login')
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :email_confirmation, :password, :password_confirmation)
  end

end
