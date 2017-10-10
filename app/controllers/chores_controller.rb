class ChoresController < ApplicationController
    def index
        @chores = Chores.all
    end
    
    def show
        id = params[:id]
        @chore = Chores.find(id)
    end
    
    def new
        @chore = Chores.new
    end
    
    def edit
    end
    
    # def create
    #     @chore=Chore.new(chore_params)
    #     if @chore.save
    #         redirect_to '/chores'
    #     else
    #         render 'new'
    #     end
    # end
    
    private 
        def chore_params
    params.require(:chore).permit(:content)
        end

    def update
    end
    
    def destroy
    end
    
    

end