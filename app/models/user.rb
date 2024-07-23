class User < ApplicationRecord
  has_secure_password
  
  rolify

  # Associations
  has_many :bookings

  # Callbacks
  after_create :assign_default_role

  private

  def assign_default_role
    self.add_role(:admin)
  end
end
