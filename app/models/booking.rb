class Booking < ApplicationRecord
    validates :date, :start_time, :end_time, :available, presence: true
end
