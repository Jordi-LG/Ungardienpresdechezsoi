class PetownerMailer < ApplicationMailer
  default from: 'no-reply@ungardienpresdechezsoi.fr'
 
  def welcome_email(petowner)
    @petowner = petowner 
    mail(to: @petowner.email, subject: 'Bienvenue chez nous !') 
  end

  def booking_a_petsitter(petsitting)
    @petsitting = petsitting
    mail(to: @petsitting.petowner.email, subject: 'Demande auprès du petsitter envoyée')
  end

  def accepted_request(petsitting)
  	@petsitting = petsitting
    mail(to: @petsitting.petowner.email, subject: 'Demande auprès du petsitter validée')
  end

  def refused_request(petsitting)
  	@petsitting = petsitting
    mail(to: @petsitting.petowner.email, subject: 'Demande auprès du petsitter refusée')
  end
end
