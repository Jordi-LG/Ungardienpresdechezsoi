class Petowner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets

  has_many :petsittings
  has_many :petsitters, through: :petsittings

  belongs_to :district

  after_create :welcome_send

  def welcome_send
    PetownerMailer.welcome_email(self).deliver_now
  end

end
