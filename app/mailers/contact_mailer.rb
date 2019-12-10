class ContactMailer < ApplicationMailer
  layout 'mailer'
 
  def contact_form(contact)
    @contact = contact
    @to = "terence30360@gmail.com"
 
    mail(to: @to, subject: "Nouveau contact depuis le site") do |format|
      format.html
    end
  end
 
end