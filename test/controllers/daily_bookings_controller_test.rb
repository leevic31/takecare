require "test_helper"

class DailyBookingsControllerTest < ActionDispatch::IntegrationTest
    setup do
        @availability_blocks = FactoryBot.create(:availability_block)
    end
    
    test "should get index" do
        get daily_bookings_url(date: Date.today), as: :json
        assert_response :success
    end

    test "should return correct bookings for the specific date" do
        get daily_bookings_url(date: Date.today), as: :json
        json_response = JSON.parse(response.body)
        assert_equal 8, json_response.length        
    end
end
