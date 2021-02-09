class Petowner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
#  has_many_attached :pets_album
  has_many :pets

  has_many :petsittings
  has_many :petsitters, through: :petsittings

  belongs_to :district
  has_many :comments

  # after_create :welcome_send

  validates :first_name, presence: true, length: { minimum: 3 }
  validates :last_name, presence: true, length: { minimum: 3 }
  validates :describe, presence: true, length: { in: 20..1000 }
  validates :age, presence: true
  validates :phone_number, presence: true, format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "Entrer un numero de telephone valide" }


  def welcome_send
    PetownerMailer.welcome_email(self).deliver_now
      @petowner = self
      @petowner.avatar.attach(io: File.open('./app/assets/images/avatar_default/default_avatar.jpg'), filename:"avatar.jpg")
      @petowner.save
  end

end
