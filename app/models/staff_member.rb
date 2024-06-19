class StaffMember < ApplicationRecord
    validates :name, presence: true
    
    has_many :service_sessions, dependent: :destroy
    has_many :services, through: :service_sessions
end
