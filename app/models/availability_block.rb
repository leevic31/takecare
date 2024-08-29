class AvailabilityBlock < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :bookings, dependent: :destroy
  belongs_to :service
  
  # Validations
  validates :start_time, :end_time, presence: true

  # Callbacks
  after_create :call_create_booking_slots

  private

  def call_create_booking_slots
    service.durations.each do |duration|
      BookingSlotCreator.create_booking_slots(self, duration.to_i.minutes)
    end
  end
end
