class Household < ActiveRecord::Base
    #household model with has many people and chores, validates name length
    has_many :people
    has_many :chores

    validates :name, :presence => true,
                    :length => { :within => 2..50 }
end
