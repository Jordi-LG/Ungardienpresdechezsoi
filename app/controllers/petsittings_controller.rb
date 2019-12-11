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
    @booking = Petsitting.find_by(petsitter_id: current_petsitter,petowner_id: petowner_choosen_id)
    @booking.validate_petsitter = true
      respond_to do |format|
        if     @booking.save
      format.js
      end
    end
  end

  def destroy
    if current_petsitter
      @petsitting = Petsitting.find_by(petowner_id: petowner_choosen_id, petsitter_id: current_petsitter)
      @petsitting.delete
      redirect_to petsitter_path(current_petsitter.id)
    else
      @petowner = Petsitting.find_by(petowner_id: current_petowner, petsitter_id: petsitter_choosen_id)
      @petowner.delete
      redirect_to petsitter_path(current_petowner.id)
    end

  end

  private
  def petsitter_choosen_id
    params.require(:id)
  end

  def petowner_choosen_id
    @petowner = Petsitting.find(params.require(:id))

    @petowner.petowner_id
  end



  def already_contacted?
    Petsitting.find_by(petowner_id: current_petowner.id, petsitter_id: petsitter_choosen_id)
  end
end
