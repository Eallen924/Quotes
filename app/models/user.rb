class User < ActiveRecord::Base
  attr_accessor :raw_password
  has_many :authors, :through => :favorite_authors
  has_many :quotes, :through => :favorite_quotes
  has_many :favorite_quotes, :dependent => :destroy
  has_many :favorite_authors, :dependent => :destroy

  validates :username, :email, :birthday, :password_hash, :presence => true
  validates :username, :email, :uniqueness => true
  # validates :password_hash, :length => { :minimum => 6 }
  validates :raw_password, :length => { :minimum => 6 }


  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
    self.raw_password = new_password
  end

  def self.human_attribute_name(attribute, options = {})
    if attribute == :raw_password
      return 'Password'
    else
      super #explicitly call super so that any attribute other than raw_password
    end
  end
end
