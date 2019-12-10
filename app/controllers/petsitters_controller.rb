class PetsittersController < ApplicationController
  before_action :signed_in, only: [:show]

  def index
    @petsitters = Petsitter.all
  end

  def show
    @petsitter = Petsitter.find(params[:id])
    #METHODE DANS LE MODEL COMMENTS
    @comments = Comment.all_comments_petsitter(params[:id])



    if current_petsitter
      @bookings = Petsitting.where(petsitter_id: current_petsitter.id)
    end

    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
      flash[:success] = "La page que vous avez demandé n'existe pas !"


  end

private

  def signed_in
    if current_petsitter.nil? & current_petowner.nil?
      redirect_to new_petowner_session_path
    end
  end
end
