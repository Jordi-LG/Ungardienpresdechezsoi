class AssociationMailer < ApplicationMailer

  def demand_association(association)
    @association = association 
    mail(to: @association.email, subject: 'Votre demande a bien été prise en compte') 
  end

  def validation_request_association(association)
    @association = association 
    mail(to: @association.email, subject: "Validation de votre demande de création d'association")
  end
end
