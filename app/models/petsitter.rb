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

  def account_validate_false
  	@petsitter = Petsitter.last
  	@petsitter.account_validate = false
	@petsitter.save  	
  end

  def demand_creation
  	PetsitterMailer.demand_creation(self).deliver_now
  end

end
