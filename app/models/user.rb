class User < ActiveRecord::Base
  has_one :password_recovery_token, :dependent => :destroy
  has_one :subscription, :dependent => :destroy
  has_many :ad_offers, :dependent => :destroy
  has_many :ad_boughts, :dependent => :destroy
  has_many :subscriptions, :dependent => :destroy
  has_many :discussions, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :logs
  belongs_to :user_type


  # ===== VALIDACIJE =====
  validates :password, length: { in: 5..20 }
  validates :username, length: { in: 4..20 }
  validates :name, length: { maximum: 50 }
  validates :contact, length: { maximum: 100 }
  validates :email, length: { maximum: 70 }
  validates :description, length: { maximum: 10000 }

  validates :username, :hashed_password, :salt, :name, presence: true

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  # ===== VALIDACIJE =====


  # 'password' - virtualni atribut
  # jer se u modelu nalazi hashed_password, ovaj atribut konvertuje plain password u hashovani
  # i spašava hashovani u model
  def password=(password)
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, self.salt)
    end
  end


  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end

  # Funkcija vraća hash vrijednost za zadati pass i salt
  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "emir" + salt)
  end


  # Funkacija koja za zadati username i pass vraća korisnika
  # ukoliko ne postoji korisnik vraća se nil
  def User.authenticate(username, password)
    if user = User.where(:username => username).first
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end



  private

  # generise salt na osnovu id objekta i random broja
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end


end
