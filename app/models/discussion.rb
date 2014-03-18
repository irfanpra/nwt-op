class Discussion < ActiveRecord::Base
  belongs_to :ad_offer
  belongs_to :user
end
