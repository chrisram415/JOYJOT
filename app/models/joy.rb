class Joy < ApplicationRecord
  belongs_to :user
  has_one :gamecard

  validates :user_id, :game_id, presence: true
  validates :description, presence: true
end
