require 'dry/monads'

class BookingRescheduler
  include Dry::Monads[:result, :do]

  def initialize(old_booking:, new_booking:)
    @old_booking = old_booking
    @new_booking = new_booking
  end

  def reschedule_booking
    yield confirm_new_booking
    yield cancel_old_booking

    Success("Successfully rescheduled booking")
  end

  private

  def confirm_new_booking
    @new_booking.confirm_booking ? Success("Successfully confirmed booking") : Failure("Failed to confirm new booking")
  end

  def cancel_old_booking
    @old_booking.cancel_booking ? Success("Successfully cancelled booking") : Failure("Failed to cancel booking")
  end
end
