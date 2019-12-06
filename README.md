## Bienvenue sur notre site de mise en relation de Petsitter et de propriétaire d'animaux : **Un gardien près de chez toi** !

### 1. Présentation
L'idée de ce site est de faciliter la recherche d'un petsitter certifié pour les propriétaires de chiens et de chats qui partent en vacances pour un week-end ou plus.

Il existe dejà des chenils ou des pensions pour cela mais l'idée ici est de favoriser un service de proximité. Le site va donc repertorier des petsitters sur la ville de Montpellier et à proximité de votre domicile qui sont prêts à garder vos animaux le temps de vos congés. Le petsitter sélectionné s'occupera de vos animaux à votre domicile ou en les prenant chez lui. La rémunération se discute entre les particuliers.

Le site proposera également une section avec des liens utiles pour les propriétaires. Nous présenterons notamment les activités des principales associations d'animaux domestiques sur Montpellier : leurs actions, accès aux "newsletters", appel aux dons, etc...

# Le concept est le suivant:
Repertorié sur la ville de Montpellier des petsitters prêt à garder vos animaux (chiens et chats) le temps de vos congés divers et variés;
Il existe déjà des chenils ou vous pouvez convié vos animaux, ici, on se propose de trouver quelqu'un à proximité de chez vous, qui peut venir s'occuper de votre animal ou l'avoir chez lui pendant un certain temps, sous rémunération.
Le site proposera aussi une partie sur les associations à Montpellier: présentation, coordonnées, actions, "newsletters", appel aux dons, etc...

## 2. Parcours utilisateur
Le principe de notre site est simple ! Comme par exemple sur le site SuperProf qui aide à trouver un super prof certifié pour donner des cours, ici il s'agit de trouver un super petsitter en qui vous aurez totalement confiance pour garder vos animaux !

Dans la navigation sur le site, n'importe qui peut consulter les annonces des petsitters et n'importe qui peut consulter les informations concernant les quelques associations référencées. Par contre, il faut bien sur s'inscrire pour profiter des services du site !
​
Une fois inscrit en tant qu'utilisateur, vous pouvez voir les annonces postées, les profils des pettsiters et ainsi bénéficier des services proposés. Vous avez aussi un profil personnel contenant des infos vous concernant et concernant les animaux à faire garder. De plus le site proposera un historique des réservations effectuées.
​
Vous pouvez également devenir petsitter. Un petsitter doit être certifié pour pouvoir poster des annonces, c'est un premier gage de confiance pour les utilisateurs (un peu comme sur blablacar où le conducteur est "validé"). Le petsitter a accès à son profil et aux profils des utilisateurs ayant besoin d'un service.
​
Les utilisateurs et les petsitters peuvent recommander un utilisateur et/ou un petsitter, commenter son profil et lui attribuer une notation.
​
## 3. Concrètement et techniquement

### 3.1. Base de données
Les tables principales seront:

* Gestion des utilisateurs (User)
* Gestion des petsitters (Petsitters)
* Gestion des fiches associations

Une table de jointure pour recenser les transactions : retrouver quel User à béneficié du service de tel Petsitters.

### 3.2. Front
Dynamique, recherche d'utilisateur, de petsitter, d'associations. Système de notifications, de recommandations, de commentaires, de rating, de messagerie.

En terme de charte graphique: nuances de vert en primaire, nuances de marrons en secondaire... Et des photos de chats et de chiens, of course !

### 3.3. Backend
Nous utiliserons des gems vu pendant la formation, avec notament Devise (gestion des utilisateurs) et Stripe (pour le paiement).

Nous aimerions mettre en place une localisation des utilisateurs/petsitters sur une carte (API google maps).

Nous voudrions également faire du scrapping pour récupérer les informations relatives aux associations.

### 3.4. Mes besoins techniques

Besoin de consolider le projet avec des personnes qui partagent l'état d'esprit du projet.

Idéalement une répartition équitable sur le front et le back en fonction des préférences (petit +: quelqu'un a l'aise avec le scrapping).

## 4. La version minimaliste mais fonctionnelle qu'il faut avoir livré la première semaine (le 6/12/19)

La première semaine, le livrable présentera :

* Système d'utilisateur avec gestion des inscriptions, pages profils
* Petsitters peut s'inscrire mais doit être valider par un admin
* Système de mailing (à l'inscription pour commencer)
* Gestion des accès aux inscrits et non-inscrits
* Page type pour une fiche d'association
    ​

## 5. La version que l'on présentera aux jury
Un site qui permettra à un visiteur de s'inscrire, et de se trouver un petsitter qui s'occupera de son animal, donc réservation et paiement effectué.

L'utilisateur pourra également faire une demande pour devenir lui même petsitter

L'utilisateur pourra rechercher une association.

Un système de localisation des petsitters et des associations, ainsi qu'un système de filtre pour rechercher par quartier.

Un système administrateur pour gérer la base de données.
