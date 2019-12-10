class PetsitterMailer < ApplicationMailer
  default from: 'no-reply@ungardienpresdechezsoi.fr'
 
  def demand_creation(petsitter)
    @petsitter = petsitter
    mail(to: @petsitter.email, subject: "Demande de création en cours") 
  end

  def validation_request(petsitter)
    @petsitter = petsitter
    mail(to: @petsitter.email, subject: "Validation de votre demande de création")
  end

  def booking_request(petsitting)
    @petsitting = petsitting
    mail(to: @petsitting.petsitter.email, subject: "Demande de garde d'un animal")   
  end

  def accepted_booking(petsitting)
    @petsitting = petsitting
    mail(to: @petsitting.petsitter.email, subject: "Demande auprès du pet owner pour la garde de son animal validé") 
  end
end
