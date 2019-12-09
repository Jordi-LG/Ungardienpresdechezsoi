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
  
  after_create :account_validate_false, :demand_creation

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :describe, presence: true, length: { in: 20..1000 }
  validates :age, presence: true
  validates :phone_number, presence: true, format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "Entrer un numero de telephone valide" }
  validates :living_space, presence: true

  def account_validate_false
  	@petsitter = Petsitter.last
  	@petsitter.account_validate = false
    @petsitter.avatar.attach(io: File.open('./app/assets/images/avatar_default/default_avatar.jpg'), filename:"avatar.jpg")
	  @petsitter.save  	
  end

  def demand_creation
  	PetsitterMailer.demand_creation(self).deliver_now
  end

end
