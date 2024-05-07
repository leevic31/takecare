require "rails_helper"

RSpec.describe "BookingsController", type: :request do
    describe "GET #index" do
        it "gets Bookings" do
            get bookings_path 
            expect(response).to have_http_status(:success)        
        end
    end

    describe "POST #create" do
        context 'when given valid booking attributes' do
            it "creates a Booking" do
                post bookings_path, params: {
                    booking: {
                        date: Date.tomorrow(), 
                        start_time: Time.current, 
                        end_time: Time.current + 5
                    }
                }
                expect(response).to have_http_status(:success)
            end
        end
        context 'when missing booking attributes' do
            it "does not create a Booking" do
                post bookings_path, params: {}
                expect(response).to have_http_status(400)
            end
        end
    end
end
