class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :user

  # ===== VALIDACIJE =====
  validates :date_subscribed, presence: true
  # ===== VALIDACIJE =====
end
