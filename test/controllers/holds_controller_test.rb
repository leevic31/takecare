require "test_helper"

class HoldsControllerTest < ActionDispatch::IntegrationTest  
  setup do
    @booking = FactoryBot.create(:booking)
  end

  test "should create hold" do
    assert_difference("Hold.count") do
      post booking_hold_url(@booking), as: :json
    end
    assert_response :created
  end

  test "should destroy hold" do
    @booking.create_hold(expires_at: 5.minutes.from_now)
    assert_difference("Hold.count", -1) do
      delete booking_hold_url(@booking), as: :json
    end
    assert_response :no_content
  end
end
