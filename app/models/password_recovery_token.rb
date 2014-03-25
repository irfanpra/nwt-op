class PasswordRecoveryToken < ActiveRecord::Base
  belongs_to :user

  # ===== VALIDACIJE =====
  validates :token, uniqueness: true
  # ===== VALIDACIJE =====
end
