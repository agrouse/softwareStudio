class Person < ActiveRecord::Base
    #Person model checks for valid user login info, gives user access to site 
    has_secure_password
    
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png", 
    :storage => :cloudinary, :path => ':id/:style/:filename'
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    
    belongs_to :household
    
    validates :first_name, :presence => true,
                    :length => { :within => 2..30 }                     
    
    validates :last_name, :presence => true,
                    :length => { :within => 2..30 }  
    
    validates :username, :presence => true,
                    :length => { :within => 2..30 } 
                    
    validates :password, :presence => true,
                :length => { :within => 5..30 } 
                
    validates :password_confirmation, :presence => true,
                :length => { :within => 5..30 } 
    
    validates_uniqueness_of :username, :message => "Username already taken"
    
    #Will not add user to the database if password confirmation does not match password
                    
    validates_confirmation_of :password, :message => "Password and confirmation should match"
    
    validates :password_confirmation, :presence => true, :if => '!password.nil?'
    
end
