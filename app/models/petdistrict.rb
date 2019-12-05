class Petdistrict < ApplicationRecord
  belongs_to :district
  belongs_to :petsitter
end
