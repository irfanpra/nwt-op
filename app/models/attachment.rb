class Attachment < ActiveRecord::Base
  belongs_to :ad_bought

  # ===== VALIDACIJE =====
  validates :path, presence: true
  # ===== VALIDACIJE =====
end
