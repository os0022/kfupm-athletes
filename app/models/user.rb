class User < ApplicationRecord
	
  has_secure_password
  has_many :matches, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates_presence_of :password, :email

end
