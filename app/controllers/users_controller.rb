class UsersController < ApplicationController

  def add
  end

  def create
    # if params[:sign_up] == 'sign_up'
    #   session[:user_id] = nil
    #   session[:username] = nil
    # end
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
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
    confirm_logged_in
    @user = User.find(session[:user_id])
    # @user = User.find(session[:user_id]) if session[:user_id]
  end

  def destroy
    if session[:user_id]
      @user = User.find(session[:user_id])
      # if params[:password].present?
      #   if params[:password] == @user.password
      @user.destroy
      session[:user_id] = nil
      session[:username] = nil
      flash[:notice] = "#{@user.username}'s account has been successfully deleted."
      redirect_to(:controller => 'access', :action => 'login')
      #   end
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :email, :email_confirmation)
  end

end
