class Pet < ApplicationRecord
  after_create :avatar_default

  belongs_to :petowner

  validates :name, presence: true
  validates :pet_type, presence: true
  validates :sterilized, presence: true
  validates :sex, presence: true

  has_one_attached :avatar
  
  def avatar_default
      @pet = Pet.last
      @pet.avatar.attach(io: File.open('./app/assets/images/avatar_default/pet_default.png'), filename:"avatar.jpg")
      @pet.save
  end
end
