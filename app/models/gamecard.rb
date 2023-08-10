class Gamecard < ApplicationRecord
  has_one_attached :photo

  belongs_to :game
  belongs_to :joy

  # validates :solved, presence: true
  # validates :image_url, presence: true
end
