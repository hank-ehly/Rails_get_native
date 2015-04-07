class AccessController < ApplicationController

  # before_attempt_login { generate_token(:auth_token) }

  # before_action generate_token(:auth_token), only: [:attempt_login]

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  # you can provide multiple columns
  def generate_token(column)
    begin
      # generates random string
      self[column] = SecureRandom.urlsafe_base64
      # make sure it's unique
    end while User.exists?(column => self[column])
  end

  def login
    # login form
  end

  def attempt_login
    generate_token(:auth_token)
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token  
      else
        cookies[:auth_token] = user.auth_token
      end
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(:controller => 'users', :action => 'show')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    cookies.delete(:auth_token)
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => 'login')
  end



end
