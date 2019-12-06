class PetsittersController < ApplicationController
  before_action :signed_in, only: [:show]

  def index
    @petsitters = Petsitter.all
  end

  def show
    @petsitter = Petsitter.find(params[:id])
    @bookings = Petsitting.where(petsitter_id: current_petsitter.id)
  end

private

def signed_in
  if current_petsitter.nil? & current_petowner.nil?
    redirect_to new_petowner_session_path

  end

end
end
