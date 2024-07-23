class DailyBookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @bookings = Booking.where("DATE(start_time) = ?", params[:date])
    render json: @bookings
  end
end
