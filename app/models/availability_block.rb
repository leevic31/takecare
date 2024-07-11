class AvailabilityBlock < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :bookings, dependent: :destroy
  
  # Validations
  validates :start_time, :end_time, presence: true

  # Callbacks
  after_create :call_create_booking_slots

  private

  def call_create_booking_slots
    BookingSlotCreator.create_booking_slots(self)
  end
end
