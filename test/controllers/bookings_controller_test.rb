require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do   
    @admin_role = FactoryBot.create(:role, :admin)
    @admin_user = FactoryBot.create(:user)
    @admin_user.add_role(@admin_role.name)

    @staff_member_role = FactoryBot.create(:role, :staff_member)
    @staff_member_user = FactoryBot.create(:user)
    @staff_member_user.add_role(@staff_member_role.name)

    @client_role = FactoryBot.create(:role, :client)
    @client_user = FactoryBot.create(:user)
    @client_user.add_role(@client_role.name)

    @organization = Organization.create(name: "Org")
    @service = Service.create(service_type: "Massage", organization_id: @organization.id)
    @service_session = ServiceSession.create(
      title: "title", 
      user_id: @staff_member_user.id,
      service_id: @service.id
    )
  end

  test "admin should get index" do
    sign_in @admin_user
    get bookings_url, as: :json
    assert_response :success
  end

  test "client should not get index" do
    sign_in @client_user
    assert_raises Pundit::NotAuthorizedError do
      get bookings_url, as: :json
    end
  end

  test "admin should create booking" do
    sign_in @admin_user

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
      as: :json 
    end
  
    assert_response :created
  end

  test "staff member should create booking" do
    sign_in @staff_member_user

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
      as: :json 
    end
  
    assert_response :created
  end

  # test "should not create booking with invalid data" do
  #   invalid_booking_params = {
  #     start_time: Time.now, 
  #     end_time: Time.now + 1.hour 
  #   }
    
  #   assert_no_difference 'Booking.count' do
  #     post bookings_url, 
  #       params: { booking: invalid_booking_params }, 
  #       headers: default_headers
      
  #     assert_response :unprocessable_entity
  #   end
  # end

  # test "should update booking" do
  #   updated_availability = true

  #   patch booking_url(@booking), 
  #     params: { 
  #       booking: {
  #         available: updated_availability 
  #       }
  #     }, 
  #     headers: default_headers

  #   @booking.reload

  #   assert_equal updated_availability, @booking.available
  # end

  # test "should not update booking with invalid data" do
  #   invalid_availability = nil

  #   patch booking_url(@booking),
  #     params: {
  #       booking: {
  #         available: invalid_availability
  #       }
  #     },
  #     headers: default_headers

  #   assert_response :unprocessable_entity
  # end

  # test "should delete booking" do
  #   assert_difference("Booking.count", -1) do
  #     delete booking_url(@booking), headers: default_headers
  #   end

  #   assert_response 204
  # end
end
