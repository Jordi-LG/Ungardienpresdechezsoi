class PetownersController < ApplicationController
  before_action :signed_in , only: [:show]

  def show
    @petowner = Petowner.find(params[:id])
    @pets = pets_of_current_petowner

    if current_petowner
      @bookings_petowner = Petsitting.where(petowner_id: current_petowner.id)
    end

  end

private

  def pets_of_current_petowner
    Pet.where(petowner_id: (params[:id]))
  end

  def signed_in
    if current_petsitter
      @petsitting = Petsitting.find_by(petsitter_id: current_petsitter.id)
      @petowner = Petowner.find(params[:id])
      if current_petsitter.nil?
      redirect_to new_petowner_session_path
      end
      if @petsitting.petowner_id != @petowner.id
        redirect_to root_path
      end
    end

    if current_petowner
      if current_petowner.id != Petowner.find(params[:id]).id
        redirect_to petowner_path(current_petowner.id)
      end
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
      flash[:success] = "La page que vous avez demandé n'existe pas !"
    end
end
