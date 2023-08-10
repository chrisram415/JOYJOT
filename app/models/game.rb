class Game < ApplicationRecord
  belongs_to :user
  has_many :gamecards
  has_many :joys, through: :gamecards

  validates :completed, presence: true
end
