class PetsittersController < ApplicationController
  def index
    @petsitters = Petsitter.all
  end

  def show
    @petsitter = Petsitter.find(params[:id])
    @bookings = Petsitting.where(petsitter_id: params[:id])

    @booking_petowners = []

    @bookings.each do |petowner|
      @booking_petowners << Petowner.find_by(id: petowner.petowner_id)
    end
    
  end

end
