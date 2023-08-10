class Joy < ApplicationRecord
  belongs_to :user
  has_one :gamecard, dependent: :destroy

  validates :user_id, :game_id, presence: true
  validates :description, presence: true
end
