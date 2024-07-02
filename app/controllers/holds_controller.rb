class HoldsController < ApplicationController
  before_action :set_booking
  
  def create
    @hold = @booking.build_hold(expires_at: 5.minutes.from_now)

    if @hold.save
      HoldDestroyJob.set(wait_until: @hold.expires_at).perform_later(@hold)
      render json: @hold, status: :created
    else
      render json: @hold.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.hold.destroy if @booking.hold
    head :no_content
  end

  private
  
  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
