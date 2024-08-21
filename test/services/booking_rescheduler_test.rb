require 'test_helper'

class BookingReschedulerTest < ActiveSupport::TestCase
    setup do
        user = FactoryBot.create(:user)
        @old_booking = create(:booking, start_time: Time.zone.parse("2024-08-03 10:00:00"), user_id: user.id)
        @old_booking.available = false
        @new_booking = create(:booking, start_time: Time.zone.parse("2024-10-24 9:00:00"), user_id: user.id)
        @booking_rescheduler = BookingRescheduler.new(old_booking: @old_booking, new_booking: @new_booking)
    end
    
    test "should reschedule booking" do
        reschedule = @booking_rescheduler.reschedule_booking
        assert_equal reschedule.success, "Successfully rescheduled booking"
        assert_nil reschedule.failure
    end

    test "should fail if unable to cancel old booking" do
        @old_booking.available = true
        reschedule = @booking_rescheduler.reschedule_booking
        assert_nil reschedule.success, nil
        assert_equal reschedule.failure, "Failed to cancel booking"
    end

    test "should fail if unable to confirm new booking" do
        @new_booking.available = false
        reschedule = @booking_rescheduler.reschedule_booking
        assert_nil reschedule.success, nil
        assert_equal reschedule.failure, "Failed to confirm new booking"
    end
end
