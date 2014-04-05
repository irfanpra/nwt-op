class Discussion < ActiveRecord::Base
  belongs_to :ad_offer
  belongs_to :user

  # ===== VALIDACIJE =====
  validates :content, length: { maximum: 1000 }
  validates :content, presence: true

  # ===== VALIDACIJE =====
end
