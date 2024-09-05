class BookingManagementsController < ApplicationController
    before_action :set_booking, only: [:create, :destroy]

    def create
        client_id = params.dig(:booking_management, :client_id)

        if client_id.nil?
            render json: { error: 'client_id is required' }, status: :unprocessable_entity
            return
        end

        if @booking.confirm_booking(client_id)
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
        params.require(:booking_management).permit(:booking_id, :available, :client_id)
    end

    def set_booking
        @booking = Booking.find(params[:booking_management][:booking_id])
    end
end
