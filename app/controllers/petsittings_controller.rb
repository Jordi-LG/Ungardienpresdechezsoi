class PetsittingsController < ApplicationController
  def new
  end

  def create
    if already_contacted?.nil? == true
      @petsitting = Petsitting.create(petowner_id: current_petowner.id, petsitter_id: petsitter_choosen_id)

      if @petsitting.save
        flash[:success] = "Votre réservation a bien été prise en compte. Votre Pet sitter va être alerté de votre demande. N'hésitez pas dés maintenant à prendre contact ensemble !"
        redirect_to petsitters_path
      end
    else
      flash[:alert] = "Vous avez déjà contacté ce Pet sitter, veuillez attendre sa réponse !"
      redirect_to petsitters_path
    end

  end

  def update
    @notification = []

    if current_petsitter
      @booking = Petsitting.find_by(petsitter_id: current_petsitter,petowner_id: validate)
      @booking.validate_petsitter = true
      PetownerMailer.accepted_request(@booking).deliver_now
    else
      @booking = Petsitting.find_by(petsitter_id: validate , petowner_id: current_petowner)
      @booking.validate_petowner = true
      PetsitterMailer.accepted_booking(@booking).deliver_now
    end
      respond_to do |format|
        if     @booking.save
        format.js
        end
      end
  end

  def show
    @notification = notifications_for_petsitter
  end

  def destroy
    if current_petsitter
      @delete_booking_petsitter = Petsitting.find_by(petsitter_id: current_petsitter, petowner_id: validate)
      @delete_booking_petsitter.destroy
      redirect_to petsitter_path(current_petsitter.id)
    else
      @delete_booking_petowner = Petsitting.find_by(petsitter_id: validate,petowner_id: current_petowner)
      @delete_booking_petowner.destroy
      redirect_to petowner_path(current_petowner.id)
    end
  end


  private

  def petsitter_choosen_id
    params.require(:id)
  end

  def validate
    if current_petowner
      @petsitter = Petsitting.find(params.require(:id))
      @petsitter.petsitter_id
    else
      @petowner = Petsitting.find(params.require(:id))
      @petowner.petowner_id
    end
  end

  def already_contacted?
    Petsitting.find_by(petowner_id: current_petowner.id, petsitter_id: petsitter_choosen_id)
  end
end
