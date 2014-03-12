class UserDatum < ActiveRecord::Base

  has_many :password_recovery_token
  has_one :user_login
  has_many :discussions
  has_many :reviews
  has_many :logs
  has_many :subscriptions
  has_many :ads


end
