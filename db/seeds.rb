# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
User.destroy_all # Remise à 0
City.destroy_all # Remise à 0
Gossip.destroy_all # Remise à 0
Tag.destroy_all # Remise à 0
GossipTag.destroy_all # Remise à 0
PrivateMessage.destroy_all # Remise à 0
Comment.destroy_all # Remise à 0



10.times do # Création de 10 villes aléatoires avec des zip_code aléatoires
  City.create(name: Faker::Address.city, zip_code: rand(10000..95000))
end

10.times do # Je définis 10 users aléatoirement etje lui affecte une des 10 villes créées
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 3, supplemental: true), email: Faker::Internet.email, age: Faker::Number.within(range: 20..50), city: City.all[rand(0..9)])
end

20.times do # Création de 20 gossips. Chaque gossip est attribué aléatoirement à un des users (un user peut ne pas avoir de gossip)
  Gossip.create(title: Faker::Hipster.word, content: Faker::Quote.most_interesting_man_in_the_world, user: User.all[rand(0..9)])
end

10.times do # Création de 10 tags aléatoires
  Tag.create(title: Faker::Lorem.word)
end

Gossip.all.each do |gossip| # Chaque gossip a aléatoirement 2 tags
  GossipTag.create(gossip: gossip, tag: Tag.all[rand(0..9)])
  GossipTag.create(gossip: gossip, tag: Tag.all[rand(0..9)])
end


10.times do # We create 10 messages that will be sent by 1 person and received by someone random. One person can receive several messages
  pm = PrivateMessage.create(content: Faker::Quote.most_interesting_man_in_the_world, sender: User.all[rand(0..9)], recipient: User.all[rand(0..9)])
end

User.create(first_name: 'anonymous', last_name: 'anonymous', description: Faker::Lorem.sentence(word_count: 3, supplemental: true), email: Faker::Internet.email, age: Faker::Number.within(range: 20..50), city: City.all[rand(0..9)],password: Faker::Verb.past)

20.times do
  c = Comment.create(content: Faker::Hipster.sentence, gossip: Gossip.all[rand(0..19)], user: User.all[rand(0..9)])
end

puts "--- seed completed ---"