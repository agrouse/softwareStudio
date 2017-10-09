class ChoresController < ApplicationController
    def index
        @chores = Chores.all
    end
    
    def hello
        render html: "Hello world"
    end

end