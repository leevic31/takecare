require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  
  setup do
    @user, @token = sign_in_as(FactoryBot.create(:user))
    @booking = bookings(:one)
    @service_session = service_sessions(:one)
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
      post bookings_url, 
      params: { 
        booking: { 
          start_time: Time.now, 
          end_time: Time.now + 1.hour, 
          date: Date.new(2023, 6, 1),
          service_session_id: @service_session.id
        },
      }, 
      headers: default_headers
    end
    
    assert_response :created
  end

  test "should not create booking with invalid data" do
    invalid_booking_params = {
      start_time: Time.now, 
      end_time: Time.now + 1.hour 
    }
    
    assert_no_difference 'Booking.count' do
      post bookings_url, 
        params: { booking: invalid_booking_params }, 
        headers: default_headers
      
      assert_response :unprocessable_entity
    end
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

  test "should not update booking with invalid data" do
    invalid_availability = nil

    patch booking_url(@booking),
      params: {
        booking: {
          available: invalid_availability
        }
      },
      headers: default_headers

    assert_response :unprocessable_entity
  end

  test "should delete booking" do
    assert_difference("Booking.count", -1) do
      delete booking_url(@booking), headers: default_headers
    end

    assert_response 204
  end
end
