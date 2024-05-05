require "rails_helper"

RSpec.describe "BookingsController", type: :request do
    describe "GET /bookings" do
        it "gets Bookings" do
            get bookings_path
            expect(response.content_type).to eq("application/json; charset=utf-8")        
        end
    end

    describe "POST /bookings" do
        it "creates a Booking" do
            post bookings_path
            expect()
        end
    end
end
