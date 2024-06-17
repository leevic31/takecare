require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  
  setup do
    @user, @token = sign_in_as(users(:lazaro_nixon))
    @booking = bookings(:one)
  end

  def default_headers
    { "Authorization" => "Bearer #{@token}" }
  end

  test "should get index" do
    get bookings_url, headers: default_headers
    assert_response :success
  end

  test "should create booking" do
    assert_difference("Booking.count") do
      post bookings_url, params: { booking: { 
        start_time: Time.now, 
        end_time: Time.now + 1.hour, 
        date: Date.new(2023, 6, 1) }, 
      }, 
      headers: default_headers
    end
    
    assert_response 204
  end

  test "should update booking" do
    updated_availability = true

    patch booking_url(@booking), 
      params: { 
        booking: {
          available: updated_availability 
        }
      }, 
      headers: default_headers

    @booking.reload

    assert_equal updated_availability, @booking.available
  end

  test "should delete booking" do
    assert_difference("Booking.count", -1) do
      delete booking_url(@booking), headers: default_headers
    end

    assert_response 204
  end
end
