class PetownersController < ApplicationController

  def show
    @petowner = Petowner.find(params[:id])
    @bookings_petowner = Petsitting.where(petowner_id: current_petowner.id)
  end
end
