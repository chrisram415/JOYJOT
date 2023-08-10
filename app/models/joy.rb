class Joy < ApplicationRecord
  has_many :gamecards, dependent: :destroy
end
