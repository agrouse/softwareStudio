class ChoresController < ApplicationController
    def index
        @chores = Chores.all
    end
    
    def show
        # id = params[:id]
        @chore = Chores.find(params[:id])
        @chore = Chores.find(id)
    end
    
    def new
        @chore = Chores.new
        # default: render 'new' template
    end
    
    def edit
    end
    
    def create 
        @chore = Chores.create!(chore_params)
        redirect_to chores_path
     end
    
    def update
        
    end
    
    def destroy
        @chore = Chores.find params[:id]
        @chore.destroy
        redirect_to chores_path
    end
    
    private 
        def chore_params
    params.require(:chore).permit("task","priority")
        end
    
end