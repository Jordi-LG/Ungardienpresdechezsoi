class AvatarsController < ApplicationController
  def create
    @petsitter = Petsitter.find(params[:petsitter_id])
@petsitter.avatar.attach(params[:avatar])
redirect_to(petsitter_path(@petsitter))
  end
end
