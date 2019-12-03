class PetownerMailer < ApplicationMailer
  default from: 'no-reply@ungardienpresdechezsoi.fr'
 
  def welcome_email(petowner)
    @petowner = petowner 

    @url  = 'https://ungardienpresdechezsoi.herokuapp.com' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @petowner.email, subject: 'Bienvenue chez nous !') 
  end
end
