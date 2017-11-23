class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  helper_method :people_of_personal_household
  helper_method :chores_of_household
  helper_method :people_of_any_household
  def people_of_personal_household
    #get user's id from currently logged in person
    userID = session[:user_id]
    #get house for associated with this user
    person = Person.find(userID)
    houseID = person.household_id
    #get all users of this house
    peopleList = []
    Person.all.each do |p|
      if p.household_id == houseID
        peopleList.push(p)
      end
    end
    return peopleList
    
  end
  def people_of_any_household(house)
    houseID = house.id
    peopleList = []
    Person.all. each do |p|
      if p.household_id == houseID
        peopleList.push(p)
      end
    end
    return peopleList
  end
    #get household_id of particular house
    
    #get people of house from 
    #return people of that house
  def chores_of_household
    #get user's id from currently logged in person
    userID = session[:user_id]
    #get house for associated with this user
    person = Person.find(userID)
    choreslist = []
    Chore.all.each do |chore|
      if chore.person_assigned == person.first_name
        choreslist.push(chore)
      end
    end
    return choreslist
    
  end
   
  
  private
    def confirm_logged_in
      unless session[:user_id]
        flash[:notice] = "Please log in."
        redirect_to(access_login_path)
      end
    end
    
end