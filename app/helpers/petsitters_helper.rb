module PetsittersHelper
  def my_petowners(arg)
    return Petowner.find(arg)
  end
end
