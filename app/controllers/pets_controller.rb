class PetsController < ApplicationController
  def new
    @pet = Pet.index_petowners_on_email
  end

  def create
    @pet = Pet.create(petowner_id: current_petowner.id, name: pet_form_params['name'], birthday: pet_form_params['birthday'], pet_type: pet_form_params['pet_type'], sterilized: pet_form_params['sterilized'], sex: pet_form_params['sex'])
    if @pet.save
      flash[:alert] = "Le profil de votre animal a bien été enregistré !"
      redirect_to petowner_path(id: current_petowner.id)
    else
      flash[:warning] = @pet.errors.messages
    end
  end

  private

  def pet_form_params
    params.require(:pet).permit(:name, :birthday, :pet_type, :sterilized, :sex)
  end

end
