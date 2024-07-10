class BookingSlotCreator
    def self.create_booking_slots
        AvailabilityBlock.all.each do |block|
            current_time = block.start_time
            while current_time < block.end_time
                # Create booking slot for 1 hour
                booking = block.bookings.create!(
                    start_time: current_time,
                    end_time: current_time + 1.hour,
                    user: block.user
                )
                current_time += 1.hour
            end
        end
    end
end
