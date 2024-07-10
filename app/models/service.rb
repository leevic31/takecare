class Service < ApplicationRecord
    # Validations
    validates :service_type, presence: true
    
    # Associations
    belongs_to :organization
end
