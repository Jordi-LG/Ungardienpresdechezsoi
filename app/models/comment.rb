class Comment < ApplicationRecord
  belongs_to :petowner

  validates :title, presence: true
  validates :content, presence: true, length: { in: 20..250 }

  def self.all_comments_petsitter(id)
    Comment.where(ps_id: id)
  end
end
