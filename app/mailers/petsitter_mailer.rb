class PetsitterMailer < ApplicationMailer
  default from: 'no-reply@ungardienpresdechezsoi.fr'
 
  def demand_creation(petsitter)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @petsitter = petsitter 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://ungardienpresdechezsoi.herokuapp.com' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @petsitter.email, subject: 'Demande de création en cours') 
  end
end
