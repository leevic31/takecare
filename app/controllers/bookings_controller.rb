class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
  end

  def update
    @booking = @booking.find(params[:id])
    @booking.update!(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :date)
  end
end
