# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Friend.destroy_all
User.destroy_all

User.create!(email: 'fry@gmail.com', password: '123')
User.create!(email: 'bender@gmail.com', password: '123')
User.create!(email: 'leela@gmail.com', password: '123')
User.create!(email: 'amy@gmail.com', password: '123')
User.create!(email: 'hermes@gmail.com', password: '123')
User.create!(email: 'scruffy@gmail.com', password: '123')
