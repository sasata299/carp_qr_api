class ScoreReport < ApplicationRecord
  scope :active, -> { where(published_at: nil) }
end
