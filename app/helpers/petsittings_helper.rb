module PetsittingsHelper
  def notifications_for_petsitter
    current_booking = Petsitting.where(petsitter_id: current_petsitter.id, validate_petsitter: false)
    @notification = current_booking.count
    return @notification
  end
end
