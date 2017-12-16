class ApplicationController < ActionController::Base
  # helpful methods used throughout the application
  protect_from_forgery with: :exception
  
  
  helper_method :people_of_personal_household
  helper_method :chores_of_household
  helper_method :people_of_any_household
  helper_method :chores_logic
  #get people of house from user's id, 
  #return list of people in that house
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
  
  #get people of house from specific house id, 
  #return list of people of that house
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
    
  #get chores of house from user's id, 
  #return list of chores of that house
  def chores_of_household
    #get user's id from currently logged in person
    userID = session[:user_id]
    #get house for associated with this user
    person = Person.find(userID)
    choreslist = []
    Chore.all.each do |chore|
      if (chore.person_assigned == person.first_name) && (chore.household_id==person.household_id)
        choreslist.push(chore)
      end
    end
    return choreslist
    
  end
  
  #chores_logic takes in a chore and determines the color output of the chore.
  #this is done using both the manually inputted status, along with the time
  #last completed, and the frequency. It first checks if it is a task by
  #seeing if status==nil, and sets the color to purple if this is the case
  #otherwise it determines values from 0-2 based on the status manually entered
  #and the time since last completed and weighted based on the priority.
  #at the end it takes the lower of the two numbers and outputs that correspond
  #color.
  def chores_logic(chore)
    status=chore.status
    priority=chore.priority
    if status == nil
      return "purple"
    end
    if chore.last_accomplished == nil
      last_accomplished = chore.created_at
    else
      last_accomplished=chore.last_accomplished
    end
    case status
    when "needs to be done"
      status="red"
      status_num =0
    when "ok condition"
      status="yellow"
      status_num = 1
    when "doesn't need to be done"
      status="green"
      status_num = 2
    when "green"
      status_num=2
    when "yellow"
      status_num=1
    when "red"
      status_num=0
    else
      status="green"
      status_num = 2
    end
    
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
    
    if priority_num < status_num
      if priority_num == 1
        return "yellow"
      else
        return "red"
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