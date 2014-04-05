class AdType < ActiveRecord::Base
  has_many :ad_offers

  # ===== VALIDACIJE =====
  validates :ad_type, length: { maximum: 20 }
  validates :ad_type, presence: true
  # ===== VALIDACIJE =====
end
