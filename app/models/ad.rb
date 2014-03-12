class Ad < ActiveRecord::Base
  has_one :ad_type
  belongs_to :user_datum
  has_many :attachments
  has_many :reviews
  has_many :discussions
end
