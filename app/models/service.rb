class Service < ApplicationRecord
    enum :service_type, [:physiotherapy, :acupuncture, :massage_therapy]
end
