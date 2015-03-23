class UsersController < ApplicationController
  def add
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to(:controller => 'user_pages', :action => 'index')
    else
      redirect_to(:controller => 'access', :action => 'sign_up')
    end
  end

  def show
  end

  def edit
  end

  def update
  	
  end

  def delete
  end

  def destroy
  	
  end

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
  end

end
