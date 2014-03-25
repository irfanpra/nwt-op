class AdType < ActiveRecord::Base
  has_many :ad_offers

  # ===== VALIDACIJE =====
  validates :type, length: { maximum: 20 }
  validates :type, presence: true
  # ===== VALIDACIJE =====
end
