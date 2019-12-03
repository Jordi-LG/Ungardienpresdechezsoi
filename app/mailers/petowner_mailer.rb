class PetownerMailer < ApplicationMailer
  default from: 'no-reply@ungardienpresdechezsoi.fr'
 
  def welcome_email(petowner)
    @petowner = petowner 
    @url  = 'https://ungardienpresdechezsoi.herokuapp.com' 
    mail(to: @petowner.email, subject: 'Bienvenue chez nous !') 
  end
end
