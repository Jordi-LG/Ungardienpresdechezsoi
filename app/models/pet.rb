class Pet < ApplicationRecord
  belongs_to :petowner

  validates :name, presence: true
  validates :pet_type, presence: true
  validates :sterilized, presence: true
  validates :sex, presence: true
end
