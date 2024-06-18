class Service < ApplicationRecord
    belongs_to :organization
    validates :service_type, presence: true
    has_many :service_sessions, dependent: :destroy
end
