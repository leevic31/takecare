class ServiceSession < ApplicationRecord
    validates :title, presence: true

    belongs_to :service
    belongs_to :staff_member
    has_many :bookings, dependent: :destroy
end
