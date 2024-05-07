class BookingsController < ApplicationController
  # TODO figure out the right way to avoid this
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def create
    @bookings = Booking.new(booking_params)
    @booking.save
  end

  def update
    @booking = @booking.find(params[:id])
    @booking.update!(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
