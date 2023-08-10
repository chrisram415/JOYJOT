class Joy < ApplicationRecord
  belongs_to :user
  has_one :gamecard

  validates :description, presence: true
end
