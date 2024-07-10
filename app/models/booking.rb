class Booking < ApplicationRecord
    # Associations
    belongs_to :availability_block
    belongs_to :user
    has_one :hold, dependent: :destroy

    # Validations
    validates :start_time, :end_time, :available, presence: true
    
    def book_appointment
        if self.available
            self.update(available: false)
        end
    end
end
