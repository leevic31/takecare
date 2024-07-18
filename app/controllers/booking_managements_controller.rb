class BookingManagementsController < ApplicationController
    before_action :set_booking, only: [:create, :destroy]

    def create
        if @booking.confirm_booking
            render json: @booking
        else
            render json: { error: 'Unable to confirm booking' }, status: :unprocessable_entity
        end
    end

    def destroy
        if @booking.cancel_booking
            render json: @booking
        else
            render json: { error: 'Unable to cancel booking' }, status: :unprocessable_entity
        end
    end

    private

    def booking_params
        params.require(:booking_management).permit(:booking_id, :available)
    end

    def set_booking
        @booking = Booking.find(params[:booking_management][:booking_id])
    end
end
