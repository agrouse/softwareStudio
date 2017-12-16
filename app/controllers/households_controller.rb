class HouseholdsController < ApplicationController
    
    #controller for household to connect users together and assign chores to only
    #those in the household
    before_action :confirm_logged_in, :except => [:joinHousehold]
    def index
        @households = Household.order(:name).page(params[:page]).per_page(5)
    end
    
    def show
        id = params[:id]
        @households = Household.find(params[:id])
        @households = Household.find(id)
    end
    
    def new
        @households = Household.new
    end
    
    #Create household with validation on the text input to be greater than 2,
    #less than 50
    def create 
        @households = Household.create(household_params)
        if @households.valid?
            flash[:notice] = "#{@households.name} was successfully created."
        else
            flash[:notice] = @households.errors.full_messages[0]
        end
        redirect_to households_path
    end
    
    def update
        @households = Household.find params[:id]
        @households.update_attributes(household_params)
        flash[:notice] = "#{@households.name} was successfully updated."
        redirect_to household_path(@households)
    end
    
    def destroy
        @households = Household.find params[:id]
        @households.destroy
        redirect_to households_path
    end
    private 
        def household_params
    params.require(:households).permit(:name,:people,:chores)
        end
    
end

