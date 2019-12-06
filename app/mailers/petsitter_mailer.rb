class PetsitterMailer < ApplicationMailer
  default from: 'no-reply@ungardienpresdechezsoi.fr'
 
  def demand_creation(petsitter)
    @petsitter = petsitter 
    @url  = 'https://ungardienpresdechezsoi.herokuapp.com' 
    mail(to: @petsitter.email, subject: "Demande de création en cours") 
  end

  def validation_request(petsitter)
    @petsitter = petsitter
    @url  = 'https://ungardienpresdechezsoi.herokuapp.com'
    mail(to: @petsitter.email, subject: "Validation de votre demande de création")
  end

  def booking_request(petsitting)
    @petsitting = petsitting
    @url  = 'https://ungardienpresdechezsoi.herokuapp.com' 
    mail(to: @petsitting.petsitter.email, subject: "Demande de garde d'un animal")   
  end
end
