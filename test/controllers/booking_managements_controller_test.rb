require "test_helper"

class BookingManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_role = FactoryBot.create(:role, :admin)
    @admin_user = FactoryBot.create(:user)
    @admin_user.add_role(@admin_role.name)

    @booking = FactoryBot.create(:booking)
  end
  
  test "should confirm a booking" do
    post booking_managements_url,
    params: { 
      booking_management: { 
        booking_id: @booking.id,
        client_id: @admin_user.id
      },
    },
    headers: auth_headers(@admin_user),
    as: :json

    assert_response 200
    @booking.reload
    assert_equal false, @booking.available 
  end

  test "should not confirm a booking without client_id" do
    post booking_managements_url,
    params: { 
      booking_management: { 
        booking_id: @booking.id
      },
    },
    headers: auth_headers(@admin_user),
    as: :json

    assert_response :unprocessable_entity
  end

  test "should cancel a booking" do
    @booking.update_columns(available: false)

    delete booking_management_url(@booking.id),
      params: { booking_management: { booking_id: @booking.id} },
      headers: auth_headers(@admin_user),
      as: :json

    assert_response 200
    @booking.reload
    assert_equal true, @booking.available
  end
end
