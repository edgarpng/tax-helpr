class User < ActiveRecord::Base
  has_many :fiscal_months, :inverse_of => :user
  attr_accessible :password, :salt, :username
end
