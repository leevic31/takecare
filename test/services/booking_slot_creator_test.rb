require 'test_helper'

class BookingSlotCreatorTest < ActiveSupport::TestCase
    setup do
        @staff_member_role = FactoryBot.create(:role, :staff_member)
        @staff_member_user = FactoryBot.create(:user)
        @staff_member_user.add_role(@staff_member_role.name)
    end

    test "creates booking slots for 1 hour bookings within availability blocks" do
        availability_block = create(:availability_block, user: @staff_member_user)  # Create an availability block for the user

        BookingSlotCreator.create_booking_slots
        
        # Expecting 8 bookings (one for each hour from 9am to 5pm)
        assert_equal 8, availability_block.bookings.count
        
        # You can add more specific assertions here based on your implementation
        # For example, check the start_time and end_time of bookings created
        availability_block.bookings.each do |booking|
          assert_in_delta booking.start_time, booking.end_time, 1.hour
        end
    end
end
