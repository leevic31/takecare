class Booking < ApplicationRecord
    # Associations
    belongs_to :availability_block
    belongs_to :user
    has_one :hold, dependent: :destroy

    # Validations
    validates :start_time, :end_time, :available, presence: true
    
    def confirm_booking
        self.update_columns(available: false) if self.available
    end

    def cancel_booking
        self.update_columns(available: true) if !self.available
    end
end
