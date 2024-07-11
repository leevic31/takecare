class BookingSlotCreator
    def self.create_booking_slots(availability_block)
        current_time = availability_block.start_time
        while current_time < availability_block.end_time
            # Create booking slot for 1 hour
            booking = availability_block.bookings.create!(
                start_time: current_time,
                end_time: current_time + 1.hour,
                user: availability_block.user
            )
            current_time += 1.hour
        end
    end
end
