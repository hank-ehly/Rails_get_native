class UsersController < ApplicationController

  before_action :confirm_logged_in, :except => [:add, :create]

  def add
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account successfully created!"
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to(:controller => 'user_pages', :action => 'index')
    else
      render('add')
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "#{@user.username}'s information updated successfully"
      redirect_to(:controller => 'user_pages', :action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @user = User.find(session[:user_id])
  end

  def destroy
    user = User.find(session[:user_id])
    user.destroy
    flash[:notice] = "#{user.username}'s account has been successfully deleted."
    session[:user_id] = nil
    session[:username] = nil
    redirect_to(:controller => 'access', :action => 'login')
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :email, :email_confirmation)
  end

end
