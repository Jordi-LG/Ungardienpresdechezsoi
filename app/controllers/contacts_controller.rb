class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new params[:contact]

    if @contact.valid?
      ContactMailer.contact_form(@contact).deliver_now
      flash.now[:send] = "Votre message a bien été envoyé"
      redirect_to new_contact_path
    else
      render new_contact_path
    end
  end

end
