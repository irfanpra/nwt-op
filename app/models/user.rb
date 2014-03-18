class User < ActiveRecord::Base
  has_one :password_recovery_token
  has_one :subscription
  has_many :ad_offers
  has_many :ad_boughts
  has_many :subscriptions
  has_many :discussions
  has_many :reviews
  has_many :logs
  belongs_to :user_type
  
end
