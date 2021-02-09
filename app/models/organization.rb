class Organization < ApplicationRecord
	has_many :donations

  validates :name, presence: true
  validates :describe, presence: true, length: { in: 30..2000 }
  validates :email, presence: true
  validates :date_of_birth, presence: true

  # after_create :demand_association

  def demand_association
  	AssociationMailer.demand_association(self).deliver_now
  end

end
