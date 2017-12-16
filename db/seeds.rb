# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#chores = Chores.create!([{task: 'Clean dishes', priority: 'high', status: 'uncompleted'}, {task: 'Trash', priority: 'moderate', status: 'completed'}])
house1 = Household.create!([{name: 'House 1'}])
bryce = Person.create!([{first_name: 'Bryce', last_name: 'Bullock', username: 'greatguy22', password: "password", password_confirmation: "password", household_id: 1}])
amy = Person.create!([{first_name: 'Amy', last_name:'Grouse', username: 'agrouse', password: "password", password_confirmation: "password", household_id: 2}])
walter = Person.create!([{first_name: 'Walter', last_name:'Ogzaly', username: 'wogzaly', password: "password", password_confirmation: "password", household_id: 1}])
erin = Person.create!([{first_name: 'Erin', last_name:'Burns', username: 'eburns', password: "password", password_confirmation: "password", household_id: 2}])
mackenna = Person.create!([{first_name: 'Mackenna', last_name:'Barker', description: 'test user', username: 'mbarker', password: "password", password_confirmation: "password", household_id: 1}])
emma = Person.create!([{first_name: 'Emma', last_name:'Peyko', username: 'epeyko', password: "password", password_confirmation: "password", household_id: 1}])
adrien = Person.create!([{first_name: 'Adrien', last_name:'Underwood', username: 'aunderwood', password: "password", password_confirmation: "password", household_id: 1}])

 
#households = Household.create!([{name: 'House 1'}])
# households = Household.create!([{name: 'House 2'}])
# households = Household.create!([{name: 'House 3'}])
# households = Household.create!([{name: 'House 4'}])
#household = @person.household.create!([{name: 'House 5'}])
#chores.save!
# Person.create(name: 'Yana', chore: chores.first)