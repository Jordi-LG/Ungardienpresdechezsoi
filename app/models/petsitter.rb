class Petsitter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :avatar

  has_many :petdistricts
  has_many :districts, through: :petdistricts

  has_many :petsittings
  has_many :petowners, through: :petsittings
end
