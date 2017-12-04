class ChoresController < ApplicationController
    
    before_action :confirm_logged_in
    def index
        @chores = Chore.order(:household_id).page(params[:page]).per_page(10)
        #@chores = Chore.order(:task).page(params[:page]).per_page(5)
        #@chores = Chore.all
    end
    
    def show
        id = params[:id]
        @chores = Chore.find(params[:id])
        @chores = Chore.find(id)
    end
    
    def new
        @chores = Chore.new
    end
    
    def create 
        @chores = Chore.create(chore_params)
        house_id=Person.find(session[:user_id]).household_id
        @chores.update(:household_id => house_id)
        @chores.update(status: "uncompleted" )
        #if @task_length.length < 2 
         #   flash[:notice] = "#{@chores.task} was successfully created."
        #else
         #   flash[:notice] = "#{@chores.task} unable to be created, check parameters."
        redirect_to chores_path
        
    end

    
    #For now, it will just delete the chore. In the future, we should keep
    #it for anaylytics and assignments. Logic will have to be implemented
    #to do this--keeping it in the database but removing it from the screen
    #idea: based on a boolean completed, it'll show up on chores_path
    def complete 
        @chores = Chore.find params[:id]
        flash[:notice] = "#{@chores.task} was successfully completed."
        @chores.destroy
        redirect_to chores_path
        
    end
    
    def update
       @chores = Chore.find params[:id]
       @chores.update_attributes(chore_params)
       flash[:notice] = "#{@chores.task} was successfully updated."
       redirect_to chore_path(@chores)
    end
    
    def destroy
        @chores = Chore.find params[:id]
        @chores.destroy
        redirect_to chores_path
    end
    
    private 
        def chore_params
    params.require(:chore).permit(:task,:priority,:status,:description,
    :person_assigned,:last_accomplished,:history,:household,:household_id)
        end
    
end