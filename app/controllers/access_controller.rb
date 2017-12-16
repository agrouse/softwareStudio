class AccessController < ApplicationController
#Log in and user authentiction  
  before_action :confirm_logged_in, :except => [:landing, :login, :attempt_login, :logout]
  
  #Logs user in if they exist
  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = Person.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:first_name] = authorized_user.first_name
      
      #if new user, join a household
      if authorized_user.household_id == nil
        redirect_to("/households")
      #if returning user, go to homepage
      else
        redirect_to("/chores")
        flash[:notice] = "You are now logged in, " + authorized_user.first_name
      end
      
    else
      #if user does not exist, redirect to login
      redirect_to("/access/login")
      flash[:notice] = "Invalid username/password combination."
    end
  end
  
  #Log out and sets token to nil
  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = 'Logged out'
    redirect_to('/chores')
  end
end
