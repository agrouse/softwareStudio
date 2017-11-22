class Chore < ActiveRecord::Base
    belongs_to :household
    
    validates_presence_of :task,
                :length => { :within => 2..30 }, 
                :format => /\A[a-zA-Z ]+\Z/
           
end