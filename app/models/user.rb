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


  # 'password' is a virtual attribute
  def password=(password)
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, self.salt)
    end
  end


  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "emir" + salt)
  end

  def User.authenticate(username, password)
    logger.debug "Pocela pretraga"
    if user = User.where(:username => username).first
      logger.debug "Username postoji #{user.username}"
      if user.hashed_password == encrypt_password(password, user.salt)
        logger.debug "Password dobar"
        user
      end
    end
  end

  private

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end


end
