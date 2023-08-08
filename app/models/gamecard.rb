class Gamecard < ApplicationRecord
  belongs_to :game
  belongs_to :joy

  validates :solved, presence: true
  validates :image_url, presence: true
end
