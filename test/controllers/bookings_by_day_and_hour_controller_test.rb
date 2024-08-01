require "test_helper"

class BookingsByDayAndHourControllerTest < ActionDispatch::IntegrationTest
    setup do
        @availability_blocks = FactoryBot.create(:availability_block)
    end
    
    test "should get index" do
        get by_day_and_hour_bookings_by_day_and_hour_index_url(date: Date.today, hour: 9), as: :json
        assert_response :success
    end

    test "should return correct bookings for the specific date and hour" do
        get by_day_and_hour_bookings_by_day_and_hour_index_url(date: Date.today, hour: 9), as: :json
        json_response = JSON.parse(response.body)
        assert_equal 1, json_response.length        
    end
end
