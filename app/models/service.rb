class Service < ApplicationRecord
    # Validations
    validates :service_type, presence: true
    validate :durations_are_positive_numbers
    
    # Associations
    belongs_to :organization
    has_many :bookings
    has_many :availability_blocks

    serialize :durations, coder: JSON

    private

    def durations_are_positive_numbers
        if durations.any? { |d| d.to_i <= 0 }
            errors.add(:durations, "must contain positive numbers only")
        end
    end
end
