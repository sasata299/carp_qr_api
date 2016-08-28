class ScoreReport < ApplicationRecord
  scope :active, -> { where(published_at: nil) }

  def publish!
    self.published_at = Time.now
    self.save!
  end
end
