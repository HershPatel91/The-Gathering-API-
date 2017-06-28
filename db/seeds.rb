# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Hersh")
User.create(name: "Niky")
Party.create(title:"Sample", admin_id: 1)
Party.create(title: "Two", admin_id: 2)
PartyGuest.create(guest_id: 1, party_id: 2)
PartyGuest.create(guest_id: 1, party_id: 1)