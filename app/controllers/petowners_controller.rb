class PetownersController < ApplicationController

  def show
        @petowner = Petowner.find(params[:id])
  end
end
