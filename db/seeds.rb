# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#chores = Chores.create!([{task: 'Clean dishes', priority: 'high', status: 'uncompleted'}, {task: 'Trash', priority: 'moderate', status: 'completed'}])
people = Person.create!([{name: 'Bryce', description: 'great guy', username: 'greatguy22'}])
#chores.save!
# Person.create(name: 'Yana', chore: chores.first)