class AdBought < ActiveRecord::Base
  has_many :attachments
  belongs_to :ad_offer 
end
