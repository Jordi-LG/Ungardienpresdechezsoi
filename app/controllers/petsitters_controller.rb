class PetsittersController < ApplicationController
  before_action :signed_in, only: [:show]

  def index
    @petsitters = Petsitter.all
    @districts = District.all_districts

    if !params_district.nil?
      @params_district = params_district
    @selected_district = Petdistrict.where(district_id: params_district)

    @petsitters_district = []
    @selected_district.each {|petsitter| @petsitters_district << Petsitter.find(petsitter.petsitter_id)}

    respond_to do |format|
      format.html { petsitters_path }
      format.js { }
    end
  end


  end

  def show
    @petsitter = Petsitter.find(params[:id])
    #METHODE DANS LE MODEL COMMENTS
    @comments = Comment.all_comments_petsitter(params[:id])
    @district = District.find((Petdistrict.find_by(petsitter_id: params[:id])).district_id)



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

  def params_district
    permitted = params.permit(:district_choosen)
    return permitted[:district_choosen]
  end
end
