class BookingSlotCreator
    def self.create_booking_slots(availability_block, duration)
        current_time = availability_block.start_time

        while current_time < availability_block.end_time
            booking = availability_block.bookings.create!(
                start_time: current_time,
                end_time: current_time + duration,
                user: availability_block.user,
                service: availability_block.service
            )
            current_time += duration
        end
    end
end
