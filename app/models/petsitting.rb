class Petsitting < ApplicationRecord
  belongs_to :petowner
  belongs_to :petsitter

  after_create :validate_petsitting_false

  def validate_petsitting_false
    @petsitting = Petsitting.last
    @petsitting.validate_petsitter = false
    @petsitting.validate_petowner = false
    @petsitting.save
  end
end
