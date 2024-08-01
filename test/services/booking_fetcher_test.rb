require 'test_helper'

class BookingFetcherTest < ActiveSupport::TestCase
    setup do
        @valid_date = '2024-07-25'
        @valid_hour = 8
    end
    
    test "should fetch bookings for a valid date and hour" do
        @booking1 = create(:booking, start_time: Time.zone.parse("#{@valid_date} #{@valid_hour}:00:00"))    
        @booking2 = create(:booking, start_time: Time.zone.parse("#{@valid_date} #{@valid_hour}:30:00"))
        @booking3 = create(:booking, start_time: Time.zone.parse("#{@valid_date} #{@valid_hour + 1}:00:00"))
    
        @booking_fetcher = BookingFetcher.new(date: @valid_date, hour: @valid_hour)
        result = @booking_fetcher.call

        assert_includes result, @booking1
        assert_includes result, @booking2
        assert_not_includes result, @booking3
    end

    test "should raise an error for an invalid hour" do
        fetcher = BookingFetcher.new(date: @valid_date, hour: 25)
        assert_raises(ArgumentError, 'Invalid hour parameter. Must be between 0 and 23.') do
            fetcher.call
        end
    end

    test "should fetch no bookings when there are no bookings within the hour" do
        fetcher = BookingFetcher.new(date: @valid_date, hour: 12)
        result = fetcher.call

        assert_empty result
    end

    test "should not fetch booking at the end of the hour" do
        @end_of_hour_booking = create(:booking, start_time: Time.zone.parse("#{@valid_date} 9:00:00"))    
        fetcher = BookingFetcher.new(date: @valid_date, hour: @valid_hour)
        result = fetcher.call

        assert_not_includes result, @end_of_hour_booking
    end
end
