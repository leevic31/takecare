class User < ApplicationRecord
  has_secure_password
  
  rolify

  # Associations

  # Can access bookings for a client or staff member with user.client_bookings user.staff_bookings
  has_many :client_bookings, class_name: 'Booking', foreign_key: 'client_id'
  has_many :staff_bookings, class_name: 'Booking', foreign_key: 'staff_member_id'

  # Callbacks
  after_create :assign_default_role

  # Validations
  validates :email, :first_name, :last_name, presence: true

  private

  def assign_default_role
    self.add_role(:admin)
  end
end
