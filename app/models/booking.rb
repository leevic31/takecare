class Booking < ApplicationRecord
    validates :date, :start_time, :end_time, presence: true
end
