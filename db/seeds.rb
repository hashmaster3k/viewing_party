# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Friend.destroy_all
Party.destroy_all
User.destroy_all

fry     = User.create!(email: 'fry@gmail.com', password: '123')
bender  = User.create!(email: 'bender@gmail.com', password: '123')
leela   = User.create!(email: 'leela@gmail.com', password: '123')
amy     = User.create!(email: 'amy@gmail.com', password: '123')
hermes  = User.create!(email: 'hermes@gmail.com', password: '123')
scruffy = User.create!(email: 'scruffy@gmail.com', password: '123')

fry.followers << bender
fry.followers << leela
fry.followers << amy
fry.followers << hermes
fry.followers << scruffy

leela.followers << fry
leela.followers << bender
leela.followers << amy

party1 = Party.create!(movie_id: 1, movie_title: 'Lego Movie', duration: 180, date: "#{Date.today}", time: "#{Time.now}")
party1.user_parties.create!(host_id: fry.id, invitee_id: leela.id)
party1.user_parties.create!(host_id: fry.id, invitee_id: bender.id)

party2 = Party.create!(movie_id: 2, movie_title: 'Batman', duration: 180, date: "#{Date.today}", time: "#{Time.now}")
party1.user_parties.create!(host_id: leela.id, invitee_id: amy.id)
party1.user_parties.create!(host_id: leela.id, invitee_id: hermes.id)
