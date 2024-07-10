class AvailabilityBlock < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :bookings, dependent: :destroy
  
  # Validations
  validates :start_time, :end_time, presence: true
end
