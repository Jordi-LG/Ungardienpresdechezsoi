class AvatarsController < ApplicationController
  def create

    if current_petsitter
      @petsitter = Petsitter.find(params[:petsitter_id])
      if params[:avatar] == nil
        flash[:alert] = "Votre photo n'a pas été ajouté"
        redirect_to petsitter_path(current_petsitter.id)
      else 
        @petsitter.avatar.attach(params[:avatar])
        flash[:success] = 'Votre photo a été ajouté'
        redirect_to(petsitter_path(@petsitter))
      end
    
    else
      if params[:pet_id]== nil
        @petowner = Petowner.find(current_petowner.id)
        if params[:avatar] == nil
          flash[:alert] = "Votre photo n'a pas été ajouté"
          redirect_to petowner_path(current_petowner.id)

        else 
          @petowner.avatar.attach(params[:avatar])
          flash[:success] = 'Votre photo a été ajouté'
          redirect_to petowner_path(current_petowner.id)
        end

      else
        if params[:avatar] == nil
          flash[:alert] = "Votre photo n'a pas été ajouté"
          redirect_to petowner_path(current_petowner.id)
        else
          @pet = Pet.find(params[:pet_id])
          @pet.avatar.attach(params[:avatar])
          flash[:success] = 'Votre photo a été ajouté'
          redirect_to petowner_path(current_petowner.id)
        end
      end
    end
  end
end
