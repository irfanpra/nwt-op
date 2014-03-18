class AdOffer < ActiveRecord::Base
  has_many :ad_boughts
  has_many :reviews
  has_many :discussions
  belongs_to :user
  belongs_to :ad_type
end
