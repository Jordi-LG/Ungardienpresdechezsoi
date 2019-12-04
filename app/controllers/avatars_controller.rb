class AvatarsController < ApplicationController
  def create
    @petsitter = Petsitter.find(params[:user_id])
@petsitter.avatar.attach(params[:avatar])
redirect_to(petsitter_path(@petsitter))
  end
end
