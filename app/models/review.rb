class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :ad_offer

  # ===== VALIDACIJE =====
  validates :content, length: { maximum: 1000 }
  validates :rating, numericality: { only_integer: true }
  validates :content, presence: true
  # ===== VALIDACIJE =====
end
