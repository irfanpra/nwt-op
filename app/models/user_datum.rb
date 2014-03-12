class UserDatum < ActiveRecord::Base

  has_many :password_recovery_token
  has_one :user_login

end
