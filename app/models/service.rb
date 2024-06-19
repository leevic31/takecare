class Service < ApplicationRecord
    validates :service_type, presence: true
    
    belongs_to :organization
    has_many :service_sessions, dependent: :destroy
    has_many :staff_members, through: :service_sessions
end
