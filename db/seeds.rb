# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
District.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('districts')
Petsitter.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('petsitters')
Petdistrict.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('petdistricts')
Petowner.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('petowners')

districs = ['Aiguelongues', 'Arceaux', 'Boutonnet', 'Croix-d argent', 'Ecusson', 'Euromédecine', 'Figuerolles', 'Gambetta', 'Hauts de Massane', 'Hopitaux Facultés', 'Malbosc','Nouveau Saint-Roch', 'Odysseum', 'Port Marianne', 'Tournezy']
15.times do |index|
  District.create(district_name: districs[index])
end

puts "Districs created"

5.times do
  p = Petsitter.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, describe: Faker::Lorem.sentence(word_count: 20), age: Faker::Number.between(from: 18, to: 40), phone_number: '+336' + Faker::Number.number(digits: 8).to_s, garden: [true, false].sample, living_space: Faker::Number.between(from: 20, to: 80), account_validate: [true, false], password: '123456', price: (Faker::Number.normal(mean: 5, standard_deviation: 1.5).round(1)))
  p.email = p.first_name + '.' + p.last_name + '@yopmail.com'
    p.avatar.attach(io: File.open('./app/assets/images/avatar_default/default_avatar.jpg'), filename:"avatar.jpg")
  p.save
  Petdistrict.create(district_id: rand(1..15), petsitter_id: p.id)
end

puts "Petsitters and petdistricts created"

5.times do
  p = Petowner.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, describe: Faker::Lorem.sentence(word_count: 20), age: Faker::Number.between(from: 18, to: 40), phone_number: '+336' + Faker::Number.number(digits: 8).to_s, password: '123456', district_id: rand(1..15))
  p.email = p.first_name + '.' + p.last_name + '@yopmail.com'
  p.save
end

puts "Petowners created"

1.times do
  Association.create(name: Faker::Beer.name, describe: Faker::Lorem.sentence(word_count: 20), date_of_birth: Faker::Date.in_date_period(year: 2016), email: Faker::Internet.email, facebook_url: 'google.com', donation_url: 'leetchi.com')
end

puts "Association created"
