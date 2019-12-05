class Petsitting < ApplicationRecord
  belongs_to :petowner
  belongs_to :petsitter
end
