class Joy < ApplicationRecord
  belongs_to :user
  has_one :gamecard, dependent: :destroy

  validates :description, presence: true
end
