require 'test_helper'

class BookingFetcherTest < ActiveSupport::TestCase
    setup do
        @staff_member_role = FactoryBot.create(:role, :staff_member)
        @staff_member = FactoryBot.create(:user)
        @staff_member.add_role(@staff_member_role.name)

        @booking1 = FactoryBot.create(:booking, :morning, :unavailable)
        @booking2 = FactoryBot.create(:booking, :morning)
        @booking3 = FactoryBot.create(:booking, :afternoon)
        @booking4 = FactoryBot.create(:booking, :evening)
    end

    test "should fetch bookings for a valid date and hour" do
        @booking_fetcher = BookingFetcher.new(date: '2024-09-16')
        bookings = @booking_fetcher.call

        assert_not_includes bookings, @booking1
        assert_includes bookings, @booking2
        assert_includes bookings, @booking3
        assert_includes bookings, @booking4
    end
end

