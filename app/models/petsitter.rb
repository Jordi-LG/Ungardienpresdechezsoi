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
  validates :describe, presence: true
  validates :age, presence: true
  validates :phone_number, presence: true
  validates :living_space, presence: true
  validates :price, presence: true

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
