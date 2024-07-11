require "test_helper"

class AvailabilityBlockTest < ActiveSupport::TestCase
  setup do
    @availability_block = FactoryBot.create(:availability_block)
  end

  test "should create 1 hour bookings after availability block is created" do
    assert_equal 8, @availability_block.bookings.count
    
    @availability_block.bookings.each do |booking|
      assert_in_delta booking.start_time, booking.end_time, 1.hour
    end
  end
end
