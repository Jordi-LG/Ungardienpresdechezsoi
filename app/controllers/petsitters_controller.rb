class PetsittersController < ApplicationController
  def index
    @petsitters = Petsitter.all
  end

  def show
    @petsitter = Petsitter.find(params[:id])
    @bookings = Petsitting.where(petsitter_id: current_petsitter.id)
  end

end
