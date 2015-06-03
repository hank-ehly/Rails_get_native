class AccessController < ApplicationController

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      if found_user = User.where(:email => params[:email]).first
        authorized_user = found_user.authenticate(params[:password])
      elsif found_admin = Admin.where(email: params[:email]).first
        authorized_admin = found_admin.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      session[:user_id] = authorized_user.id
      session[:email] = authorized_user.email
      flash[:success] = "You are now logged in."
      redirect_to(:controller => 'users', :action => 'profile')
    elsif authorized_admin
      # mark admin as logged in
      session[:admin_id] = authorized_admin.id
      session[:email] = authorized_admin.email
      flash[:success] = "You are now logged in."
      redirect_to(:controller => 'users', :action => 'profile')
    else
      flash[:danger] = "Invalid email/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    reset_session
    flash[:success] = "You have been logged out."
    redirect_to(:action => 'login')
  end

end
