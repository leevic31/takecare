class BookingsByDateController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    date = params[:date]

    begin
      bookings = BookingFetcher.new(date: date).call
      response = bookings.map do |booking|
        { 
          id: booking.id,
          start_time: booking.start_time,
          staff_member: booking.staff_member.first_name
        }
      end

      render json: response
      
    rescue ArgumentError => e
      render json: { error: e.message }, status: :bad_request
    end
  end
end

