class ServiceSession < ApplicationRecord
    validates :title, presence: true

    belongs_to :service
    belongs_to :user
    has_many :bookings, dependent: :destroy
end
