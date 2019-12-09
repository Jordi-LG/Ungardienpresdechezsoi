class AvatarsController < ApplicationController
  def create

    if current_petsitter
      @petsitter = Petsitter.find(params[:petsitter_id])
      @petsitter.avatar.attach(params[:avatar])
      redirect_to(petsitter_path(@petsitter))
    else
      @petowner = Petowner.find(params[:petowner_id])
      @petowner.avatar.attach(params[:avatar])
      redirect_to(petowner_path(@petowner))
    end

  end

  
end
