class PetSittersController < ApplicationController

  def index
    @pet_sitters = Petsitter.all
  end

  def show
    @pet_sitter = Petsitter.find(params[:id])
  end
end
