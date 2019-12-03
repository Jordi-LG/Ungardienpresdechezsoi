class PetsitterMailer < ApplicationMailer
  default from: 'no-reply@ungardienpresdechezsoi.fr'
 
  def demand_creation(petsitter)
    @petsitter = petsitter 
    @url  = 'https://ungardienpresdechezsoi.herokuapp.com' 
    mail(to: @petsitter.email, subject: 'Demande de création en cours') 
  end

  def request_validation(petsitter)
    @petsitter = petsitter
    @url  = 'https://ungardienpresdechezsoi.herokuapp.com'
    mail(to: @petsitter.email, subject: 'Validation de votre demande de création')
  end
end
