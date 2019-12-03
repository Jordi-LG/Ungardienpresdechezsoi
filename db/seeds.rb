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
Petowner.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('petowners')

15 times do
 District.create(district_name: ['Aiguelongues', 'Arceaux', 'Boutonnet', "Croix-d'argent", 'Ecusson', 'Euromédecine', 'Figuerolles', 'Gambetta', 'Hauts de Massane', 'Hopitaux Facultés', 'Malbosc','Nouveau Saint-Roch', 'Odysseum', 'Port Marianne', 'Tournezy'].sample)
end

5 times do
  Petsitter.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, describe: Faker::Lorem.sentence(word_count: 20), age: Faker::Number.between(from: 18, to: 40), phone_number: '+336' + Faker::Number.number(digits: 8).to_s, garden: [true, false].sample, living_space: Faker::Number.between(from: 20, to: 80), account_validate?: [true, false])
end

5 times do
  Petowner.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, describe: Faker::Lorem.sentence(word_count: 20), age: Faker::Number.between(from: 18, to: 40), phone_number: '+336' + Faker::Number.number(digits: 8).to_s)
end
