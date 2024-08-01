class BookingFetcher
    def initialize(date:, hour:)
        @date = date
        @hour = hour.to_i
    end

    def call
        validate_hour
        fetch_bookings
    end

    private

    def validate_hour
        if @hour < 0 || @hour > 23
            raise ArgumentError, 'Invalid hour parameter. Must be between 0 and 23.'
        end
    end

    def fetch_bookings
        start_time = Time.zone.parse("#{@date} #{@hour}:00:00")
        end_time = start_time + 1.hour
        Booking.where("start_time >= ? AND start_time < ?", start_time, end_time)
    end
end
