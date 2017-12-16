class PeopleController < ApplicationController
    #user controller that fixes access to site based on login
    #and creates users with valid info
    before_action :confirm_logged_in, :except => [:new, :create, :signup]
    
    def index
        @people = Person.all
    end
    
    def show
        id = params[:id]
        @people = Person.find(params[:id])
        @people = Person.find(id)
    end
    
    def new
        @people = Person.new
    end
    #Create person initially with no household id set, validation on the five 
    #possible text inputs and uniqueness of username
    def create 
        @people = Person.create(people_params)
        if @people.valid?
            flash[:notice] = "#{@people.username} was successfully created."
            redirect_to "/access/login"
        else
            flash[:notice] = @people.errors.full_messages[0]
            redirect_to "/people/signup"
        end
    end
    
    def update
        @people = Person.find(params[:id])
        #check to make sure person is updating their own profile only
        if Person.find(session[:user_id]) != @people
           flash[:notice] = "Access Denied"
        else 
            @people.update_attributes(people_params)
            flash[:notice] = "#{@people.first_name} was successfully updated."
        end 
       redirect_to person_path(@people)
    end
    def joinhouse
        @households = Household.find params[:id]
        person=Person.find(session[:user_id])
        person.update(:household_id => params[:id] )
        flash[:notice] = "#{person.first_name} was successfully updated."
        redirect_to person_path(person)
        puts "hello"
    end
    
    def destroy
        @people = Person.find params[:id]
        @people.destroy
        redirect_to people_path
    end
    
    private 
        def people_params
    params.require(:people).permit(:first_name, :last_name, :image, :password,:password_confirmation,:username,:description,:household,:household_id)
        end
    
end