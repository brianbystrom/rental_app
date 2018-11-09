# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!( fname:  "Joe #{n}",
                lname:  "Schmo #{n}",
                email: email,
                username: "testuser#{n}",
                password:              password,
                password_confirmation: password,
                status:  true,
                admin:   false,
                street:  "9201 University City Blvd",
                city:    "Charlotte",
                state:   "NC",
                zip:     "28223")
end

10.times do |n|
    @item = Item.create!(   user_id: 1,
                    serial_no: "SNO000#{n}",
                    name: "Item #{n}",
                    tag: "tag1, tag2",
                    price: "#{n}",
                    brand: "Brand #{n}",
                    model: "Model #{n}")
end