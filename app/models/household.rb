class Household < ActiveRecord::Base
    #household model with has many people and chores, validates name presence and length
    has_many :people
    has_many :chores

    validates :name, :presence => true,
                    :length => { :within => 2..50 }
    validates_uniqueness_of :name, :message => "House name already taken"
end
