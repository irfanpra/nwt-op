class AdOffer < ActiveRecord::Base
  has_many :ad_boughts
  has_many :reviews
  has_many :discussions
  belongs_to :user
  belongs_to :ad_type

  def self.search(keyword, type, price)
    query = ""
    if keyword
      query = "title LIKE %#{keyword}% OR subtitle LIKE %#{keyword}%"
    end

    if type
      if query.length == 0
        query += "type LIKE %#{type}%"
      else
        query += " OR type LIKE %#{type}%"
      end
    end

    if price
      if query.length == 0
        query += "price LIKE %#{price}%"
      else
        query += " OR price LIKE %#{price}%"
      end
    end
    if query.length > 0
      ads = AdOffer.where query
    end
    ads
  end

end
