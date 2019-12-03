class PetsitterMailer < ApplicationMailer
  default from: 'no-reply@ungardienpresdechezsoi.fr'
 
  def demand_creation(petsitter)
    @petsitter = petsitter 
    @url  = 'https://ungardienpresdechezsoi.herokuapp.com' 
    mail(to: @petsitter.email, subject: 'Demande de création en cours') 
  end

  def validation_request(petsitter)
    @petsitter = petsitter
    @url  = 'https://ungardienpresdechezsoi.herokuapp.com'
    mail(to: @petsitter.email, subject: 'Validation de votre demande de création')
  end

  def reservation_request(petowner, petsitter)
    @petowner = petowner
    @petsitter = petsitter
    @url  = 'https://ungardienpresdechezsoi.herokuapp.com' 
    mail(to: @petowner.email, subject: 'Demande auprès du petsitter envoyé')   
  end
end
