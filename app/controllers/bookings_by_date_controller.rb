class BookingsByDateController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    date = params[:date]

    begin
      bookings = BookingFetcher.new(date: date).call
      render json: bookings.as_json(include: {staff_member: { only: :first_name}})
    rescue ArgumentError => e
      render json: { error: e.message }, status: :bad_request
    end
  end
end

