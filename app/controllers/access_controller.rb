class AccessController < ApplicationController
  
  before_action :confirm_logged_in, :except => [:landing, :login, :reg, :attempt_login, :logout, ]
  def menu
  end

  def login
  end
  
  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = Person.where(:username => params[:username]).first
      if found_user
        puts "hello"
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:first_name] = authorized_user.first_name
      flash[:notice] = "You are now logged in, " + authorized_user.first_name
      redirect_to("/access/home")
      
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = 'Logged out'
    redirect_to('/chores')
  end
end
