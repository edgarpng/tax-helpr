require 'bcrypt'

class User < ActiveRecord::Base
  has_many :fiscal_months, :inverse_of => :user
  attr_accessible :password, :salt, :email
  validates :email, :presence => true, :uniqueness => {:case_sensitive => false}

  before_save :encrypt_password

  def self.authenticate email, password
  	user = find_by_email email
  	if user && user.password == 
      BCrypt::Engine.hash_secret(password, user.salt)
  		user
  	else
  		nil
  	end
  end

  def encrypt_password
  	if password.present?
  		self.salt = BCrypt::Engine.generate_salt
  		self.password = BCrypt::Engine.hash_secret password, salt
  	end
  end

end