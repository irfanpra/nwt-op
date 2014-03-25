class UserType < ActiveRecord::Base
  has_many :users

  # ===== VALIDACIJE =====
  validates :type, length: { maximum: 20 }
  validates :type, presence: true
  # ===== VALIDACIJE =====
end
