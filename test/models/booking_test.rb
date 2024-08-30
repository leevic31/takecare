require "test_helper"

class BookingTest < ActiveSupport::TestCase
  setup do
    @booking = FactoryBot.create(:booking)
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

  test "book_appointment should change availablity of booking from true to false" do
    @booking.confirm_booking
    assert_equal false, @booking.available
  end
  
  test "cancel_appointment should change availability of booking from false to true" do
    @booking.available = false
    @booking.cancel_booking
    assert_equal true, @booking.available
  end
end
