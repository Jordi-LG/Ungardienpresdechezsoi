class Association < ApplicationRecord

  validates :name, presence: true
  validates :describe, presence: true, length: { in: 30..500 }
  validates :email, presence: true
  validates :date_of_birth, presence: true
end
