class Log < ActiveRecord::Base
  belongs_to :user

  # ===== VALIDACIJE =====
  validates :description, length: { maximum: 1000 }
  validates :description, presence: true

  # ===== VALIDACIJE =====
end
