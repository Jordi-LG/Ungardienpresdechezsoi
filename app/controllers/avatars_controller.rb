class AvatarsController < ApplicationController
  def create

    if current_petsitter
      @petsitter = Petsitter.find(params[:petsitter_id])
      @petsitter.avatar.attach(params[:avatar])
      redirect_to(petsitter_path(@petsitter))
    else
      if params[:pet_id]== nil
        @petowner = Petowner.find(current_petowner.id)
        @petowner.avatar.attach(params[:avatar])
      else
        @pet = Pet.find(params[:pet_id])
        @pet.avatar.attach(params[:avatar])

      end
      redirect_to(petowner_path(current_petowner))
    end

  end


end
