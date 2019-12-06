class PetownersController < ApplicationController
  before_action :signed_in , only: [:show]

  def show
    @petowner = Petowner.find(params[:id])

    if current_petowner
      @bookings_petowner = Petsitting.where(petowner_id: current_petowner.id)
    end 
  end

  def signed_in
    if current_petsitter.nil? & current_petsitter
      redirect_to new_petowner_session_path
    end
  end
end
