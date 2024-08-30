require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest  
  setup do   
    @admin_role = FactoryBot.create(:role, :admin)
    @admin_user = FactoryBot.create(:user)
    @admin_user.add_role(@admin_role.name)

    @organization = Organization.create(name: "Org")
    @service = Service.create(service_type: "Massage", organization_id: @organization.id)

    @availability_block = FactoryBot.create(:availability_block)
    @booking = FactoryBot.create(:booking)
  end

  test "should get index" do
    get bookings_url, headers: auth_headers(@admin_user), as: :json
    assert_response :success
  end

  test "should create booking" do
    assert_difference("Booking.count") do
      post bookings_url, 
      params: { 
        booking: { 
          start_time: Time.now, 
          end_time: Time.now + 1.hour, 
          staff_member_id: @admin_user.id,
          availability_block_id: @availability_block.id,
          service_id: @service.id
        },
      },
      headers: auth_headers(@admin_user),
      as: :json 
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
        headers: auth_headers(@admin_user),
        as: :json
      
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
      as: :json

    @booking.reload

    assert_equal updated_availability, @booking.available
  end

  test "should not update booking with invalid data" do
    invalid_end_time = nil

    patch booking_url(@booking),
      params: {
        booking: {
          end_time: invalid_end_time
        }
      },
      headers: auth_headers(@admin_user),
      as: :json

    assert_response :unprocessable_entity
  end

  test "should delete booking" do
    assert_difference("Booking.count", -1) do
      delete booking_url(@booking),
      headers: auth_headers(@admin_user),
      as: :json
    end

    assert_response 204
  end
end
