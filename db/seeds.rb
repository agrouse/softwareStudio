# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# In this file we have automated seeding of users. We have seeded 7 users and one household

house1 = Household.create!([{name: '31 McAlister Dr'}])
house2 = Household.create!([{name: '725 Heatherwood Rd'}])
bryce = Person.create!([{first_name: 'Bryce', last_name: 'Bullock', username: 'greatguy22', password: "password", password_confirmation: "password", household_id: 1}])
amy = Person.create!([{first_name: 'Amy', last_name:'Grouse', username: 'agrouse', password: "password", password_confirmation: "password", household_id: 2}])
walter = Person.create!([{first_name: 'Walter', last_name:'Ogzaly', username: 'wogzaly', password: "password", password_confirmation: "password", household_id: 1}])
erin = Person.create!([{first_name: 'Erin', last_name:'Burns', username: 'eburns', password: "password", password_confirmation: "password", household_id: 2}])
mackenna = Person.create!([{first_name: 'Mackenna', last_name:'Barker', description: 'test user', username: 'mbarker', password: "password", password_confirmation: "password", household_id: 1}])
emma = Person.create!([{first_name: 'Emma', last_name:'Peyko', username: 'epeyko', password: "password", password_confirmation: "password", household_id: 1}])
adrien = Person.create!([{first_name: 'Adrien', last_name:'Underwood', username: 'aunderwood', password: "password", password_confirmation: "password", household_id: 1}])

