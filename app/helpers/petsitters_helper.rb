module PetsittersHelper
  def my_petowners(arg)
    return Petowner.find(arg)
  end

  def petowner_exists(arg)
    return Petowner.find_by(id: arg).blank?
  end

end
