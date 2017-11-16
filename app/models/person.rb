class Person < ActiveRecord::Base
    has_secure_password
    belongs_to :household
    
    validates :first_name, :presence => true,
                            :length => { :within => 2..30 },
                            :format => /\A[a-zA-Z]+\Z/                        
    
    validates :last_name, :presence => true,
                            :length => { :within => 2..30 },
                            :format => /\A[a-zA-Z]+\Z/
               
    #validates :description, :length => { :within => 0..30}
    #                        :format => /\A[a-zA-Z0-9 ]+\Z/
    #validates :password, :presence => true,
    #                        :length => { :within => 7..30}
    
    validates :username, :presence => true,
                            :length => { :within => 3..30}
end
