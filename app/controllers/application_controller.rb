class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(access_login_path)
    end
  end
  
  def people_of_household()
    #get user's id from currently logged in person
    @user = Person.find(params[:id])
    #get house for associated with this user
    @houseID = @user.household_id
    @house = Households.find(houseID)
    #get all users of this house
    @peopleInHouse = house.people
    return peopleInHouse
    
  end
end
