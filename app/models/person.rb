class Person < ActiveRecord::Base
    has_secure_password
    belongs_to :household
    
    # attr_accessor :password_confirmation
    
    # attr_accessor :user_name
    # attr_protected :password
    
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
                            
    validates_confirmation_of :password, :message => "Password and confirmation should match"
    
    validates :password_confirmation, :presence => true, :if => '!password.nil?'
    
    # validates :password, 
    #       # you only need presence on create
    #       :presence => { :on => :create },
    #       # allow_nil for length (presence will handle it on create)
    #       :length   => { :minimum => 6, :allow_nil => true },
    #       # and use confirmation to ensure they always match
    #       :confirmation => true
end
