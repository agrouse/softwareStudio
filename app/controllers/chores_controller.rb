class ChoresController < ApplicationController
    #controller for both tasks and chores, with status being nil for tasks
    before_action :confirm_logged_in
    def index
        @chores = Chore.order(:status).page(params[:page]).per_page(50)
    end
    
    def show
        id = params[:id]
        @chores = Chore.find(params[:id])
        @chores = Chore.find(id)
    end
    
    def new
        @chores = Chore.new
    end
    #Create chore with household id set by user who created it's household id
    #note validation on the two possible text inputs must be greater than 2,
    #less than 50
    def create 
        @chores = Chore.create(chore_params)
        if @chores.valid?
            house_id=Person.find(session[:user_id]).household_id
            @chores.update(:household_id => house_id)
            flash[:notice] = "#{@chores.task} was successfully created."
        else
            flash[:notice] = @chores.errors.full_messages[0]
        end
        redirect_to chores_path
    end

    
    #complete chore updates last_complete time to current time, and changes
    #status to green, however if it is a task (i.e. status is nil) just 
    #deletes the chore
    def complete 
        @chores = Chore.find params[:id]
        if @chores.status == nil
            @chores.destroy
            flash[:notice] = "#{@chores.task} was successfully completed."
            redirect_to chores_path
        else
            @chores.last_accomplished=Time.now
            @chores.update(:status => "green")
            flash[:notice] = "#{@chores.task} was successfully completed."
            redirect_to chores_path
        end
        
    end
    
    def update
       @chores = Chore.find params[:id]
       @chores.update_attributes(chore_params)
       flash[:notice] = "#{@chores.task} was successfully updated."
       redirect_to chore_path
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