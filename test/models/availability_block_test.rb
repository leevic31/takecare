require "test_helper"

class AvailabilityBlockTest < ActiveSupport::TestCase
  setup do
    @availability_block = FactoryBot.create(:availability_block)
  end

  test "should create 30 minute, 60 minute and 90 minute bookings" do
    assert_equal 30, @availability_block.bookings.count
  end

  test "should create 60 minute bookings after availability block is created" do
    sixty_minute_bookings = @availability_block.bookings.select do |booking|
      duration = booking.end_time - booking.start_time
      duration_in_minutes = duration / 60
      duration_in_minutes == 60
    end

    assert_equal sixty_minute_bookings.count, 8
  end
end
