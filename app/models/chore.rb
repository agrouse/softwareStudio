class Chore < ActiveRecord::Base
    #chore model with validations of task and priority lengths
    belongs_to :household
    
    validates :task, :presence => true,
                    :length => { :within => 2..50 }
    validates :priority, :presence => true,
                    :length => { :within => 2..50 }

           
end