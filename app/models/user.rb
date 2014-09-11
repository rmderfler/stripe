class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  #validates_presence_of :last_4_digits
  attr_accessor  :stripe_token
end
