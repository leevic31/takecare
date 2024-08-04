require 'test_helper'

class BookingFetcherTest < ActiveSupport::TestCase
    test "should fetch bookings for a valid date and hour" do
        @booking1 = create(:booking, start_time: Time.zone.parse("2024-08-03 9:00:00"))    
        @booking2 = create(:booking, start_time: Time.zone.parse("2024-08-03 9:30:00"))
        @booking3 = create(:booking, start_time: Time.zone.parse("2024-10-24 9:00:00"))
        @booking4 = create(:booking, start_time: Time.zone.parse("2024-08-03 10:00:00"))    

        @booking_fetcher = BookingFetcher.new(date: "2024-08-03")
        bookings = @booking_fetcher.call
        bookings_for_valid_date = bookings[9]
    
        assert_includes bookings_for_valid_date, @booking1
        assert_includes bookings_for_valid_date, @booking2
        assert_not_includes bookings_for_valid_date, @booking3
        assert_not_includes bookings_for_valid_date, @booking4
    end
end

