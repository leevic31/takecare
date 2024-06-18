require "test_helper"

class BookingTest < ActiveSupport::TestCase
  setup do
    @booking = Booking.new(
      available: true,
      start_time: "2024-05-04 13:45:12",
      end_time: "2024-05-04 13:45:12",
      date: "2024-05-04"
    )
  end

  test "should be valid" do
    assert @booking.valid?
  end

  test "available should be present" do
    @booking.available = nil
    assert_not @booking.valid?
  end

  test "start time should be present" do
    @booking.start_time = nil
    assert_not @booking.valid?
  end

  test "end time should be present" do
    @booking.end_time = nil
    assert_not @booking.valid?
  end

  test "date should be present" do
    @booking.date = nil
    assert_not @booking.valid?
  end

  test "book_appointment should change availablity of booking from true to false" do
    @booking.book_appointment
    assert_equal false, @booking.available
  end
end
