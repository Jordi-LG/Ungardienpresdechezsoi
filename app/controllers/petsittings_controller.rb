class PetsittingsController < ApplicationController
  def new
  end

  def create
    Petsitting.create(petowner_id: current_petowner.id, petsitter_id: petsitter_choosen_id)
  end


  private
  def petsitter_choosen_id
    params.require(:id)
  end
end
