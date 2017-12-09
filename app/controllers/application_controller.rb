class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  helper_method :people_of_personal_household
  helper_method :chores_of_household
  helper_method :people_of_any_household
  helper_method :chores_logic
  helper_method :current_user
  helper_method :change_person_assigned
  
  def change_person_assigned(old_name)
    Chore.all.each do |c|
      if c.person_assigned == old_name
        c.person_assigned == current_user.first_name
      end
    end
    
  end

  def current_user
    if session[:user_id]
      @current_user = Person.find(session[:user_id])
    
    else
      @current_user = nil
    end
  end
  
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

  #def sortTimes

  
  #def showSortedTable
    #choresList=[]
    #if chore.status == incomplete 
      #if chore.priority == high
        #append sorted list
      #elif chore.priority == moderate
        #append moderate to high
      #else
        #append low to moderate
    
  #def changePriority(chore)
    #for all chores on table
      #if chore.timeValue !> 0 and chore.priority!="low":
        #upgrade priority
    #showSortedTable  
      


  def chores_logic(chore)
    status=chore.status
    priority=chore.priority
    last_accomplished=chore.last_accomplished
    case status
    when "needs to be done"
      status_num =0
    when "ok condition"
      status_num = 1
    when "doesn't need to be done"
      status_num = 2
    else
      status_num = 2
    end
    if last_accomplished != nil
    
    case priority
    when "daily"
      priority_num =2-((Time.now-last_accomplished)/28800).truncate
    when "weekly"
      priority_num =2-((Time.now-last_accomplished)/201600).truncate
    when "monthly"
      priority_num =2-((Time.now-last_accomplished)/806400).truncate
    else
      priority_num = 2
    end
    
    else
      priority_num = 2
    end
    if priority_num < status_num
      if priority_num == 1
        return "ok condition"
      else
        return "needs to be done"
      end
    else
      return status
    end
  end
   

  
  private
    def confirm_logged_in
      unless session[:user_id]
        flash[:notice] = "Please log in."
        redirect_to(access_login_path)
      end
    end
    
end