class PetownersController < ApplicationController
  before_action :signed_in , only: [:show]

  def show
    @petowner = Petowner.find(params[:id])

    if current_petowner
      @bookings_petowner = Petsitting.where(petowner_id: current_petowner.id)
    end

  end

private

  def signed_in
    if current_petsitter.nil? & current_petsitter
      redirect_to new_petowner_session_path
    end

      if current_petowner.id != Petowner.find(params[:id]).id
        redirect_to petowner_path(current_petowner.id)
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
      flash[:success] = "La page que vous avez demandé n'existe pas !"
  end

end
