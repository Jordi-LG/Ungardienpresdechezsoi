# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Organization.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('organizations')
District.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('districts')
Petsitter.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('petsitters')
Petdistrict.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('petdistricts')
Petowner.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('petowners')
Comment.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('comments')
Petsitting.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('petsittings')
AdminUser.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('adminusers')



Organization.create(name: "Les Pattounes du Coeur", describe: "Aujourd'hui, notre association compte une vingtaine de bénévoles. Elle vient en aide aux nombreux chats abandonnés et sans foyer de Montpellier et ses alentours. Nous stérilisons et identifions les chats « sauvages », ainsi ils deviennent des « chats libres », ils sont soignés et nourris par le biais de nombreux points de nourrissage où des bénévoles leur amènent de la nourriture tous les jours. Lorsque nous trouvons des chats sociables ou des chatons, nous les plaçons en famille d’accueil puis nous les faisons adopter sous contrat associatif, avec un engagement de stérilisation pour les chatons. Nous n’avons donc pas de refuge mais des familles d’accueil qui hébergent un ou plusieurs chats chacune. Pour cela, nous devons faire face à de nombreux frais pour la nourriture et les frais vétérinaires. Notre association fonctionne uniquement grâce aux dons que nous recevons. Pour pouvoir sauver les chats de la rue, nous avons impérativement besoin de familles d’accueil pour accueillir nos petits protégés le temps qu’ils soient définitivement adoptés, alors si vous avez une petite place pour héberger un minou, faites nous signe ! Sans vous, notre action est impossible ! ",
date_of_birth: "20-01-2013", email: "lespattounesducoeur@gmail.com", facebook_url: 'https://www.facebook.com/pg/lespattounes34', donation_url: 'https://www.leetchi.com/c/appel-a-laide-des-pattounes?fbclid=IwAR2jKIyyB7gv4p7TFPYrY2rvAy0_pKGzLmhOETgFykrd-wjko7UcPQW2CCM', validate_association: true,
image_tag: "associations/logo_pattounes.jpg", describe_short: "Nous sommes une association à but non lucratif qui s'occupe de chats errants à Montpellier." , actions:"Stérilisation, identification et nourrissage des chats dits \"errants\"", actions_2: "Placement en famille d\'accueil des chats recceuillis dans la rue"  )


Organization.create(name: "Or\'felins", describe: "Anciennement, nous nous occupions de l'association \"Les Chats Libres Aigues-Mortais\" (crée en 2007, avec plus de 200 adoptions chaque année et des centaines de stérilisations). Puis, nous avons eu envie de créer une association couvrant le secteur de Lunel à Montpellier, secteur déjà desservi par quelques associations mais malheureusement toujours beaucoup plus de demandes de prises en charge que de places dans les associations... Il était donc urgent d'agir, et nous avons décidé de nous servir de notre expérience pour créer \"Or\'Felins\" le 13 septembre 2016. Bien entendu l\'association des chats libres existe toujours et couvre le secteur d\'Aigues-Mortes et proches alentours. Nos missions restent les mêmes, à savoir : réguler la prolifération des chats errants, prendre en charge les chatons, les stériliser ainsi que leurs mères. Placer les chats sociables en familles d\'accueil afin qu\'ils soient adoptés....",
date_of_birth: "13-09-2016", email: "orfelins34@gmail.com", facebook_url: 'https://www.facebook.com/OrFelins', donation_url: 'https://www.leetchi.com/', validate_association: true,
image_tag: "associations/logo_orfelins.jpg",describe_short: "Nous sommes une association à but non lucratif qui s'occupe de chats errants à Montpellier." , actions:"Réguler la prolifération des chats errants par la stérilisation, prise en charge des chatons", actions_2: "Placement en famille d\'accueil des chats sociables" )

Organization.create(name: "SPA Montpellier Méditerranée Métropole", describe: "La SPA de Montpellier Méditerranée Métropole est une association de protection animale qui accueille les animaux abandonnés, et les animaux entrés en fourrière et non récupérés par leurs maîtres. Nous identifions ces animaux, nous les vaccinons, nous les stérilisons et nous les proposons à l\'adoption pour leur offrir une seconde chance. La SPA s\'occupe également de diligenter des enquêtes pour maltraitance ou négligence sur les animaux, signalés par des tiers. Par ailleurs, nous relayons tout ce qui concerne la protection animale en général.",
date_of_birth: "01-01-1934", email: "contact@spa-montpellier.org", facebook_url: 'https://www.facebook.com/pg/spamontpelliermediterraneemetropole/about/?ref=page_internal', donation_url: 'https://www.facebook.com/pg/spamontpelliermediterraneemetropole/fundraisers/?ref=page_internal', validate_association: true,
image_tag: "associations/logo_spa.png", describe_short: "Nous sommes une association à but non lucratif de protection animale à Montpellier." , actions:"Prendre en charge, aider les animaux abandonnés, secourir les maltraités ou errants", actions_2: "Faire adopter les animaux recueillis au refuge dans les meilleures conditions possibles" )


puts "Association created"

districs = ['Montpellier', 'Aiguelongues', 'Arceaux', 'Boutonnet', 'Croix-d argent', 'Ecusson', 'Euromédecine', 'Figuerolles', 'Gambetta', 'Hauts de Massane', 'Hopitaux Facultés', 'Malbosc','Nouveau Saint-Roch', 'Odysseum', 'Port Marianne', 'Tournezy']
16.times do |index|
  District.create(district_name: districs[index])
end

puts "Districs created"


5.times do
  p = Petsitter.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, describe: Faker::Lorem.sentence(word_count: 20), age: Faker::Number.between(from: 18, to: 40), phone_number: '+336' + Faker::Number.number(digits: 8).to_s, garden: [true, false].sample, living_space: Faker::Number.between(from: 20, to: 80), account_validate: [true, false], password: '123456', price: (Faker::Number.normal(mean: 5, standard_deviation: 1.5).round(1)))
  p.email = p.first_name + '.' + p.last_name + '@yopmail.com'
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

25.times do
  Comment.create(title: Faker::Book.title, content: Faker::Lorem.sentence(word_count: 20), petowner_id: rand(1..30), ps_id: rand(1..5))
end

puts "Comments created"

# 1.times do
#   Petsitting.create(petsitter_id: rand(1..30), petowner_id: rand(1..30))
# end

puts 'No Petsitting created'

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

puts "Admin created"
