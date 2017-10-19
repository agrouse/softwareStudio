class ChoresController < ApplicationController
    def index
        @chores = Chores.all
    end
    
    def show
        id = params[:id]
        @chore = Chores.find(params[:id])
        @chore = Chores.find(id)
    end
    
    def new
        @chore = Chores.new
        # default: render 'new' template
    end
    
    def create 
        @chore = Chores.create!(chore_params)
        redirect_to chores_path
     end
    
    def update
       @chore = Chores.find params[:id]
       @chore.update_attributes!(chore_params)
       redirect_to chore_path(@chore)
    end
    
    def destroy
        @chore = Chores.find params[:id]
        @chore.destroy
        redirect_to chores_path
    end
    
    private 
        def chore_params
    params.require(:chore).permit("task","priority","status","description",
    "person_assigned","last_accomplished","history")
        end
    
end