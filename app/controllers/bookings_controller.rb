class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def create
    @bookings = Booking.new(booking_params)
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
