module PetsittersHelper
  def my_petowners(arg)
    return Petowner.find(arg)
  end

  def booking_validate
    Petsitting.find_by(petowner_id: current_petowner.id, petsitter_id: params[:id])
  end

  def petowner_exists(arg)
    return Petowner.find_by(id: arg).blank?
  end

end
