class Booking < ApplicationRecord
    # Associations
    belongs_to :availability_block
    belongs_to :service
    has_one :hold, dependent: :destroy
    belongs_to :client, class_name: 'User', foreign_key: 'client_id', optional: true
    belongs_to :staff_member, class_name: 'User', foreign_key: 'staff_member_id'

    # Validations
    validates :start_time, :end_time, :available, presence: true
    
    def confirm_booking
        self.update_columns(available: false) if self.available
    end

    def cancel_booking
        self.update_columns(available: true) if !self.available
    end
end
