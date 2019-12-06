class Petsitting < ApplicationRecord
  belongs_to :petowner
  belongs_to :petsitter

  after_create :validate_petsitting_false

  def validate_petsitting_false
    @petsitting = Petsitting.last
    @petsitting.validate_petsitter = false
    @petsitting.validate_petowner = false
    PetownerMailer.booking_a_petsitter(@petsitting).deliver_now
    PetsitterMailer.reservation_request(@petsitting).deliver_now
    @petsitting.save
  end
end
