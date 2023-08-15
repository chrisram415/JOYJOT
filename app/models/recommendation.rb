class Recommendation < ApplicationRecord
  belongs_to :user

  validates :activity, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_activity,
    against: [ :activity ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
