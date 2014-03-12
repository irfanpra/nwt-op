class Subscription < ActiveRecord::Base
  belongs_to :user_datum
  has_many :user_datas
end
