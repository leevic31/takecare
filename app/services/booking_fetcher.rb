class BookingFetcher
  def initialize(date:)
    @date = Date.parse(date)
  end

  def call
    fetch_bookings
  end

  private

  def fetch_bookings
    Booking.includes(:staff_member)
      .where(start_time: @date.beginning_of_day..@date.end_of_day, available: true)
      .order(:start_time)
  end
end
