require "test_helper"

class BookingTest < ActiveSupport::TestCase
  setup do
    @booking = FactoryBot.create(:booking)

    @client_role = FactoryBot.create(:role, :client)
    @client_user = FactoryBot.create(:user)
    @client_user.add_role(@client_role.name)
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
    assert_equal true, @booking.available

    @booking.confirm_booking(@client_user.id)
    assert_equal false, @booking.available
  end
  
  test "cancel_appointment should change availability of booking from false to true" do
    @booking.available = false
    @booking.cancel_booking
    assert_equal true, @booking.available
  end

  test "booking client_id should belong to the user that confirmed the booking" do
    assert_nil @booking.client_id

    @booking.confirm_booking(@client_user.id)
    assert_equal @booking.client_id, @client_user.id
  end

  test "booking client_id should be nil after cancelling the booking" do
    @booking.client_id = @client_user.id
    assert_equal @booking.client_id, @client_user.id

    @booking.available = false
    @booking.cancel_booking

    assert_nil @booking.client_id
  end
end
