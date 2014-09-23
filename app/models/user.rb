class User < ActiveRecord::Base

  has_secure_password

  has_many :collections

  attr_accessor :password_digest

  validates :login, presence: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 6 }

end
