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

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :describe, presence: true, length: { in: 20..1000 }
  validates :age, presence: true
  validates :phone_number, presence: true


  def welcome_send
    PetownerMailer.welcome_email(self).deliver_now
  end

end
