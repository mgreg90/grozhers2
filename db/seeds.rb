# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 = User.create(username: 'Admin1', password: '123456')
g1 = Group.create(name: 'Admin')
i1 = Item.create(name: 'first item', description: 'seeds.rb line 11')
puts "*" * 50
puts "So far so good!"
puts "*" * 50
