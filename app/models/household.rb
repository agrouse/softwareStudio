class Household < ActiveRecord::Base
    has_many :people
    has_many :chores

    validates :name, presence: true,
                :length => { :within => 4..30 },
                :format => /\A[a-zA-Z0-9 ]+\Z/      
end
