class AdType < ActiveRecord::Base
  has_many :ad_offers

  # ===== VALIDACIJE =====
  validates :user_type, length: { maximum: 20 }
  validates :user_type, presence: true
  # ===== VALIDACIJE =====
end
