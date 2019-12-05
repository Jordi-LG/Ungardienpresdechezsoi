class PetsittingsController < ApplicationController
  def new
  end

  def create
    @petsitting = Petsittings.new
    puts "ù"*60
    @petsitting.petowner_id = current_petowner.id
    @petsitting.petsitter_id = params[:id]
    @petsitting.save
    puts "save"

    if @petsitters.save
      redirect_to root_path
    end
  end
end
