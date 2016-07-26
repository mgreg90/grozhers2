# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 = User.create(username: 'Mike', password: '123456')
u2 = User.create(username: 'Dany', password: '123456')
g1 = Group.create(name: 'Gregory Family')
i1 = Item.create(name: 'Straws', description: 'bendy straws for tumblers')
i2 = Item.create(name: 'Eggs', description: "they're actually good for you")
g1.users << u1
g1.users << u2
g1.items << i1
g1.items << i2
Hirb.enable
puts "*" * 50
puts "Users:"
puts User.all
puts "-" * 30
puts "Groups:"
puts Group.all
puts "-" * 30
puts "Items:"
puts Item.all
puts "*" * 50
