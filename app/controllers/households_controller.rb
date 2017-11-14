class HouseholdsController < ApplicationController
    
    before_action :confirm_logged_in
    def index
        @households = Household.all
    end
    
    # def show
    #     id = params[:id]
    #     @chore = Chore.find(params[:id])
    #     @chore = Chore.find(id)
    # end
    
    # def new
    #     @chore = Chore.new
    #     # default: render 'new' template
    # end
    
    # def create 
    #     @chore = Chore.create!(chore_params)
    #     redirect_to chores_path
    # end
    
    # #For now, it will just delete the chore. In the future, we should keep
    # #it for anaylytics and assignments. Logic will have to be implemented
    # #to do this--keeping it in the database but removing it from the screen
    # #idea: based on a boolean completed, it'll show up on chores_path
    # def complete 
    #     @chore = Chore.find params[:id]
    #     flash[:notice] = "#{@chore.task} was successfully completed."
    #     @chore.destroy
    #     redirect_to chores_path
        
    # end
    
    # def update
    #   @chore = Chore.find params[:id]
    #   @chore.update_attributes!(chore_params)
    #   flash[:notice] = "#{@chore.task} was successfully updated."
    #   redirect_to chore_path(@chore)
    # end
    
    # def destroy
    #     @chore = Chore.find params[:id]
    #     @chore.destroy
    #     redirect_to chores_path
    # end
    
    # private 
    #     def chore_params
    # params.require(:chore).permit(:task,:priority,:status,:description,
    # :person_assigned,:last_accomplished,:history,:household)
    #     end
    
end