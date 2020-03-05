# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Channel.count == 0
  channel =  Channel.create({ name: 'Discovery'})
  Show.create({name: 'Animal Safari' , channel_id: channel.id})

  channel2 =  Channel.create({ name: 'Star Movies'})
  Show.create({name: 'Transformers' , channel_id: channel2.id})

end

