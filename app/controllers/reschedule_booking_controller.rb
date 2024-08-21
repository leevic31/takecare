class RescheduleBookingController < ApplicationController
  before_action :set_booking, only: [:create]

  def create

  end

  private

  def booking_params
    params.require(:booking).permit(:id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end 
end
