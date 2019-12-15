### Welcome to our site linking Pet-sitter and Pet-owner: **Un gardien près de chez toi** !

- Link to our Heroku website: https://ungardienpresdechezsoi.herokuapp.com/

### 1. Presentation

The idea was to facilitate the search for a certified Pet sitter for owners of dogs and cats who go on week-end or holidays.

Kennels and pensions already exist but here, the goal was to  promote a local service between individuals. Therefore, this site list Pet-sitters close to Pet-owners homes in Montpellier. The Pet-sitter selected by a person will take care of the pets at Petowner's home or by taking them in their own home. All conditions of the petsitting, including the price, is **discussed between individuals**.

The site also offer a section with the activities of the main associations on Montpellier: their actions, call for donation...

### 2. User experience

The aim of our site is simple. In the same way as on the site "SuperProf", which aim at helping finding certified teachers, here we want to find a **certified petsitter in wich you can trust** to look after our pets.

In navigation of the site, anyone can consult announcements of Petsitters or the list of the referenced associations. However, you must register to access the site's services.

Once you registered as a *Petowner*, you can see announcements posted and the profiles of the Petsitters. Then you can contact a petsitter to benefit from his services.

You have a personal profile containing your personal data, informations about your pets and the possibility to manage his bookings. You also have a public profile with restricted informations, only see by the petsitters you contact.

Once you registered as a *Petsitter*, your profile must be validate by the administrator of the website to confirm your identity and certified ability to looking after pets. The petsitter can access only his own profile or the profiles of petowners wich demand him a petsitting.

The Petsitter have access to his personal profile containing personal data, the comments made by petowners and the possibility to manage his bookings.
​
​
### 3. Concretely and technically

#### 3.1. Databases

The tables of the database are :

* `Petsitters`
* `Petowners`
* `Pets`
* `Districs`
* `Organizations`
* `Comments`
* `Donations`

A jointable `Petsittings` make the link between the tables `Petsitters` and `Petowners` in order to manage the bookings. An other jointable connect the `Petsitters` and the `Districts` in wich they can do petsittings.

#### 3.2. Front

We wanted a site with green theme. And obviously, a lot of photos of cats and dogs !


#### 3.3. Backend

We used `gems` covered in the THP courses : Devise (management of two differents profiles of users), Stripe (payment for supporting associations), ActiveAdmin (Dashboard admin, admin@example.com / password, to validate pet sitters and organization)...

### Team
We were 4 members of the 10th session of The Hacking Project in Montpellier to worked on this project :
- Jordi Le Guet
- Terence Le Guet
- Paul Hennin
- Marine El Adouzi
