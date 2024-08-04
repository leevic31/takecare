require "test_helper"

class BookingsByDateControllerTest < ActionDispatch::IntegrationTest
    setup do
        @availability_blocks = FactoryBot.create(:availability_block)
    end
    
    test "should get index" do
      get by_date_bookings_by_date_index_url(date: Date.today), as: :json
      assert_response :success
    end
end

