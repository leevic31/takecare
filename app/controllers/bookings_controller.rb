class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy]

  def index
    @bookings = policy_scope(Booking)
    authorize Booking
    render json: @bookings
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking 

    if @booking.save
      render json: @booking, status: :created
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @booking

    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :date, :available, :service_session_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
