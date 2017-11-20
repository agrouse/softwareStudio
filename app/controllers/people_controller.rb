class PeopleController < ApplicationController
    
    before_action :confirm_logged_in, :except => [:new, :create]
    
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
        # default: render 'new' template
    end
    
    def create 
        @people = Person.create(people_params)
        redirect_to people_path
    end
    
    #For now, it will just delete the chore. In the future, we should keep
    #it for anaylytics and assignments. Logic will have to be implemented
    #to do this--keeping it in the database but removing it from the screen
    #idea: based on a boolean completed, it'll show up on chores_path
    
    def update
               
       @people = Person.find(params[:id])
        if Person.find(session[:user_id]) != @people
           flash[:notice] = "Access Denied"
        else 
            @people.update_attributes(people_params)
            flash[:notice] = "#{@people.first_name} was successfully updated."
        end 
       redirect_to person_path(@people)
    end
    
    def destroy
        @people = Person.find params[:id]
        @people.destroy
        redirect_to people_path
    end
    
    private 
        def people_params
    params.require(:people).permit(:first_name, :last_name,:password,:username,:description,:household,:household_id)
        end
    
end