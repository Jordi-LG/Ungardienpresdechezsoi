class PetsittersController < ApplicationController
  def index
    @petsitters = Petsitter.all
  end

  def show
    @petsitters = Petsitter.find(params[:id])
  end
end
