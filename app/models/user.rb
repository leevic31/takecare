class User < ApplicationRecord
  rolify

  # Associations
  has_many :bookings
end
