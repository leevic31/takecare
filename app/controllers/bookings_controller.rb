class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy]

  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
  end

  def update
    @booking.update(booking_params)
  end

  def destroy
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :date, :available)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
