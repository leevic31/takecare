class Booking < ApplicationRecord
    validates :date, :start_time, :end_time, :available, presence: true

    def book_appointment
        if self.available
            self.update(available: false)
        end
    end
end
