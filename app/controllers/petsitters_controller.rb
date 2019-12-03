class PetsittersController < ApplicationController
  def index
    @petsitters = Petsitter.all
  end

  def show
    @petsitter = Petsitter.find(params[:id])
  end
end
