class Booking < ApplicationRecord
    validates :date, :start_time, :end_time, :available, presence: true

    belongs_to :service_session

    def book_appointment
        if self.available
            self.update(available: false)
        end
    end
end
