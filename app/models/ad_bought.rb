class AdBought < ActiveRecord::Base
  has_many :attachments, :dependent => :destroy
  belongs_to :ad_offer

  # ===== VALIDACIJE =====
  validates :duration, numericality: { only_integer: true }

  # ===== VALIDACIJE =====
end
