class Service < ApplicationRecord
    # Validations
    validates :service_type, presence: true
    
    # Associations
    belongs_to :organization
    has_many :booking
    has_many :availability_block
end
