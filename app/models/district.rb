class District < ApplicationRecord
  has_many :petowners

  has_many :petdistricts
  has_many :petsitters, through: :petdistricts

  def self.all_districts
    District.all
  end
end
