class Service < ApplicationRecord
    belongs_to :organization
    enum :service_type, [:physiotherapy, :acupuncture, :massage_therapy]
end
