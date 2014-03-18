class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :ad_offer
end
