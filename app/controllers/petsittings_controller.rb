class PetsittingsController < ApplicationController
  def new
  end

  def create
    Petsitting.create(petowner_id: current_petowner, petsitter_id: params[:id])
  end
end
