class PetownerMailer < ApplicationMailer
  default from: 'no-reply@ungardienpresdechezsoi.fr'
 
  def welcome_email(petowner)
    @petowner = petowner 
    @url  = 'https://ungardienpresdechezsoi.herokuapp.com' 
    mail(to: @petowner.email, subject: 'Bienvenue chez nous !') 
  end

  def booking_a_petsitter(petowner, petsitter)
    @petowner = petowner
    @petsitter = petsitter
    @url  = 'https://ungardienpresdechezsoi.herokuapp.com' 
    mail(to: @petowner.email, subject: 'Demande auprès du petsitter envoyé')
  	
  end
end
