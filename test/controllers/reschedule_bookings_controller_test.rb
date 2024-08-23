require 'test_helper'

class RescheduleBookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = FactoryBot.create(:user)
    @old_booking = create(:booking, start_time: Time.zone.parse("2024-08-03 10:00:00"), user_id: user.id)
    @old_booking.available = false
    @new_booking = create(:booking, start_time: Time.zone.parse("2024-10-24 9:00:00"), user_id: user.id)
  end

  test "should create a rescheduled booking" do
    post reschedule_bookings_url,
    params: {
      reschedule_booking: {
        old_booking_id: @old_booking.id,
        new_booking_id: @new_booking.id
      },
    },
    as: :json

    assert_response :ok
  end
end
