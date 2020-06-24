# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Player.create!(name: "BBC (管理者)",
             email: "admin@gmail.com",
             password:                 "yyyyyy",
             password_confirmation:    "yyyyyy",
             admin: true )