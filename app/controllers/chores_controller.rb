class ChoresController < ApplicationController
    def index
        @chores = Chores.all
    end
end