class Comment < ApplicationRecord
  belongs_to :petowner

  validates :title, presence: true
  validates :content, presence: true, length: { 20.. 250 }
end
