class User < ApplicationRecord
  has_secure_password
  
  rolify

  # Associations
  has_many :bookings
end
