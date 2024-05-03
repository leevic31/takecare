class Service < ApplicationRecord
    belongs_to :organization
    validates :service_type, presence: true
    has_many :sessions
end
