class Pet < ApplicationRecord
  belongs_to :petowner

  validates :name, presence: true
  validates :pet_type, presence: true
  validates :sterilized, presence: true
  validates :sex, presence: true

  has_one_attached :avatar

  after_create :attached_avatar

  def attached_avatar
  	@pet = Pet.last
  	@pet.avatar.attach(io: File.open('./app/assets/images/avatar_default/default_avatar.jpg'), filename:"avatar.jpg")
  	@pet.save
  end
end
