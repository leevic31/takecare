class UserBookingsController < ApplicationController
    before_action :authenticate_user!

    def index
        @bookings = current_user.client_bookings.includes(:service)
 
        render json: @bookings.as_json(include: :service)
    end
end
