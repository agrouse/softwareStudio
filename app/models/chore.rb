class Chore < ActiveRecord::Base
    belongs_to :household
    
    validates :task, presence: true,
                :length => { :within => 4..30 },
                :format => /\A[a-zA-Z ]+\Z/
           
end