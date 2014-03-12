class Ad < ActiveRecord::Base
  has_one :ad_type
  belongs_to :user_datum
end
