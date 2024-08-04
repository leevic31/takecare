class BookingFetcher
  def initialize(date:)
    @date = Date.parse(date)
    @bookings_by_hour = {}
  end

  def call
    fetch_bookings
  end

  private

  def fetch_bookings
    (8..20).each do |hour|
      start_hour, end_hour = @date.to_datetime.change(hour: hour), @date.to_datetime.change(hour: hour + 1)
      bookings = Booking.where('start_time >= ? AND start_time < ?', start_hour, end_hour)
      @bookings_by_hour[hour] = bookings 
    end

    @bookings_by_hour
  end
end

