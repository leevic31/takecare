require "rails_helper"

RSpec.describe "BookingsController", type: :request do
    describe "GET /bookings" do
        it "gets Bookings" do
            get bookings_path
            expect(response).to have_http_status(:success)        
        end
    end
end
