class RescheduleBookingsController < ApplicationController
  before_action :set_old_booking, only: [:create]
  before_action :set_new_booking, only: [:create]

  def create
    booking_rescheduler = BookingRescheduler.new(old_booking: @old_booking, new_booking: @new_booking)
    booking_reschedule_result = booking_rescheduler.reschedule_booking

    if booking_reschedule_result.success?
      render json: { message: booking_reschedule_result.success }
    else
      render json: { message: booking_reschedule_result.failure }
    end
  end

  private

  def reschedule_booking_params
    params.require(:reschedule_booking).permit(:old_booking_id, :new_booking_id)
  end

  def set_old_booking
    @old_booking = Booking.find(params[:reschedule_booking][:old_booking_id])
  end

  def set_new_booking
    @new_booking = Booking.find(params[:reschedule_booking][:new_booking_id])
  end
end
