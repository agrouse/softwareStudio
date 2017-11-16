class Household < ActiveRecord::Base
    has_many :people
    has_many :chores
    accepts_nested_attributes_for :people
end
