class HouseholdsController < ApplicationController

    before_action :confirm_logged_in
    def index
        @households = Household.all
    end
    
    def show
        id = params[:id]
        @households = Household.find(params[:id])
        @households = Household.find(id)
       # @household = Household.where(:person => )
    end
    
    def new
        @households = Household.new
        # default: render 'new' template
    end
    
    def create 
        @households = Household.create!(household_params)
        redirect_to households_path
    end
    
    def update
        @households = Household.find params[:id]
        @households.update_attributes!(household_params)
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

