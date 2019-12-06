module PetownersHelper
  def my_petsitters(arg)
    return Petsitter.find_by(id: arg)
  end

  def petsitter_exists(arg)
    return Petsitter.find_by(id: arg).blank?
  end
end
