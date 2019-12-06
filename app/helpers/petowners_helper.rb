module PetownersHelper
  def my_petsitters(arg)
    return Petsitter.find(arg)
  end
end
