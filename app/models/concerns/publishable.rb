module Publishable
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where(published_at: nil) }
  end

  def publish!
    self.published_at = Time.now
    self.save!
  end
end
