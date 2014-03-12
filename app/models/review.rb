class Review < ActiveRecord::Base
  belongs_to :user_data
  belongs_to :ad
end
