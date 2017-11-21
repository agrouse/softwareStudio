class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  

  helper_method :people_of_household
   def people_of_household
     #get user's id from currently logged in person
     userID = session[:user_id]
  #   #get house for associated with this user
     person = Person.find(userID)
     houseID = person.household_id
     house = Household.find(houseID)
  #   #get all users of this house
     peopleList = []

    return peopleList
   end
   
  
  private
    def confirm_logged_in
      unless session[:user_id]
        flash[:notice] = "Please log in."
        redirect_to(access_login_path)
      end
    end
    
end