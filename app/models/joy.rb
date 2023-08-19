class Joy < ApplicationRecord
  belongs_to :user
  has_one :gamecard, dependent: :destroy

  # validates :description, presence: true
  validates :description, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5, message: 'Rating must be between 1 and 5' }
end
