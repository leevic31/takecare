class Service < ApplicationRecord
    enum :type, [:physiotherapy, :acupuncture, :massage_therapy]
end
